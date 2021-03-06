-- print("Loading "..arg[0])

function mothome_init(rec)
end

function mothome_proc(rec)
  luaiocsup.ioclog_info("Preparing homing")

  -- Prepare parameters and set state to Moving
  rec.update_field("VALB",1) -- 1=Prepare
  rec.update_field("VLDB",1)
  rec.update_field("VALA",3) -- 3=Moving
  rec.update_field("VLDA",1)
  coroutine.yield(0)

  luaiocsup.ioclog_info("Moving to end-of-travel")
  -- Retrieve move-to value
  move_to=rec.retrieve_field("B")
  -- Move motor to limit-switch
  rec.update_field("VALC",move_to)
  rec.update_field("VLDC",1)

  -- Wait for done-move
  repeat
    coroutine.yield(0)
    done_move=rec.retrieve_field("A")
    luaiocsup.ioclog_info("Are we there yet...?")
  until done_move ~= 0

  luaiocsup.ioclog_info("Start homing")
  -- Set state to Homing
  rec.update_field("VALA",4) -- 4=Homing
  rec.update_field("VLDA",1)
  -- Home motor
  rec.update_field("VALD",1)
  rec.update_field("VLDD",1)
  coroutine.yield(0)

  -- Wait for done-move
  repeat
    coroutine.yield(0)
    done_move=rec.retrieve_field("A")
    luaiocsup.ioclog_info("Are we there yet...?")
  until done_move ~= 0

  luaiocsup.ioclog_info("Finished homing")
  -- Restore parameters
  rec.update_field("VALB",0) -- 0=Restore
  rec.update_field("VLDB",1)
  -- Set state to Success
  rec.update_field("VALA",1) -- 1=Success
  rec.update_field("VLDA",1)
  -- Stop record processing
  -- rec.update_field("VALE",0) -- 0=Passive
  -- rec.update_field("VLDE",1)
  rec.update_field("SCAN",0) -- 0=Passive
  -- coroutine.yield(0)

  return 0
end


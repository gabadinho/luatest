
-- should also receive the AI record/table!!!
-- ability to return things like S_db_errArg,S_db_badField
-- ability to return the list of desired record fields
--function init_record(ai)
function init_record(rec)
  --print("Lua AI init_record "..ai.inp)
  print("Lua AI init_record ")
  print(rec.record_name())
  print("ARG "..arg[0])
  print(luaiocsup.self.record_name())
  -- return {}
  return 0
end

function read_ai2(rec)
  -- print("Lua AI read_ai "..ai.udf)
  print("Lua AI read_ai ")
  a=luaiocsup.self.retrieve_field("VAL")
  print("Lua AI read_ai => "..a)
  -- LUADEVSUP.self.updateMyField("VAL",2.1)
--  ai.udf=0
--  return -1.2
--  return 2,ai
  -- return 2,{udf=0,val=-1.2}
--  return {udf=0,val=-1.3},2
  -- WHAT IS FIELD HSV CALLING LINCONV?!?!?!
  -- return 0,{VAL=2,HIGH=4}
  return 0
end

function callback3(rec,p1)
  if (rec) then
    print("callback3!!!!!!!!!!!!!!!!!!!!!!!!!!!"..rec.record_name())
    print(p1)
  else
    print("callback3!!!!!!!!!!!!!!!!!!!!!!!!!!!")
  end
  return 1,"a",3
end

--function callback3()
--  print("callback3!!!!!!!!!!!!!!!!!!!!!!!!!!!")
--end

function read_ai(rec)
  print("Lua AI read_ai")
  print(rec.record_name())
  rec.update_field("HOPR",2.1)

  print(luaiocsup.self)
  print(rec)

  -- luaiocsup.scan_once("LUA:AI1")

  rec.update_field("PREC",3)

  myval=rec.retrieve_field("VAL")
  -- print("BEFORE VAL IS "..myval)
  luaiocsup.ioclog_info("BEFORE VAL IS "..myval)
  rec.update_field("VAL",1.234)
  myval=rec.retrieve_field("VAL")
  print("AFTER VAL IS "..myval)
  
  -- print("************************* BEFORE PROCESSING AO9")
  -- luaiocsup.db_process("LUA:AO9")
  -- print("************************* AFTER PROCESSING AO9")

  -- rec.update_field("PACT",1)
  rec.pact(1)
  coroutine.yield(0,callback3,3.14)

  -- rec.update_field("PACT",0)
  rec.pact(0)
  return 2
  -- return 0  -- THIS DOES NOT UPDATE VAL
  -- return 1  -- THIS UPDATES VAL BUT GENERATES ERROR IN CLIENT!!!
end

function add_record(rec)
  print("ADD RECORD ai.lua")
  print(rec.record_name())
  return 0
end

function del_record(rec)
  print("DELETE RECORD ai.lua")
  print(rec.record_name())
  return 0
end

print("ai.lua")
print("ARG")
print(arg[0])
print("ARG")
print(arg[1])
print("ARG")
print(arg[2])
print("ARG")
print(arg[3])
print("ARG")
print(arg[4])
print("ARG")
print(arg[5])
print("ARG")

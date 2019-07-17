-- function init_record(rec)
--   print("stringin.lua init_record ")
--   print(rec.recordName())
--   return 0
-- end

-- luaiocsup.scanio_init("iostringin")

-- function get_ioint_info(rec,cmd)
--   return "iostringin"
-- end

function read_stringin(rec,p1)
  print("stringin.lua read_stringin")
  print(rec.record_name())

  desc=rec.retrieve_field("DESC")
  luaiocsup.ioclog_info("DESC IS "..desc)

  -- luaiocsup.ioc_log_info("USERDATA IS "..rec.userdata)
  print(p1)

  myval=rec.retrieve_field("VAL")
  -- print("BEFORE VAL IS "..myval) -- use LUAIOCSUP.lon instead!!!
  luaiocsup.ioclog_info(1,2,3,"BEFORE VAL IS "..myval,2)
  if myval=="setbla" then
    rec.userdata.bla=1
  elseif myval=="getbla" then
    luaiocsup.ioclog_info("MYBLA IS "..rec.userdata.bla)
  end

  luaiocsup.post_event(10)

  rec.update_field("VAL","teste")

  return 0
end

print("stringin.lua")

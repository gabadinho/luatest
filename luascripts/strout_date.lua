-- print("Loading "..arg[0])

function write_stringout(rec)
  date_format=nil
  date_format=arg[1]
  -- rec.VAL="bla"
  -- print(rec.VAL)
  if (date_format==nil) then
    rec.update_field("VAL",os.date())
  else
    rec.update_field("VAL",os.date(date_format))
  end

  rec2=luaiocsup.find_record("DEVSUP:DATE")
  print(rec2.record_name())
  rec2.scan_lock()
  rec2.process()
  -- luaiocsup.ioclog_info(rec2.val)  -- THIS CORE-DUMPS THE IOC!!! ioclog_info(nil)
  val2=rec2.val
  print(val2)
  -- luaiocsup.ioclog_info(val2)
  -- luaiocsup.ioclog_info(nil) -- Segmentation fault
  luaiocsup.ioclog_info(rec2.VAL)
  rec2.scan_unlock()
  -- rec2.scan_once()
end

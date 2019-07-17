function ao3_atexit(a1,a2)
  print("AO3_ATEXIT!!!")
  print(a1)
  print(a2)
end

function init_record(rec)
  print("ao3.lua init_record")
  print(rec.record_name())
  luaiocsup.at_exit(ao3_atexit,2,3,4)
end

function write_ao(rec)
  print("Lua AO3 write_ao")
  rec.retrieve_field("DESC")

  -- sdis=rec.retrieve_field("SDIS")
  -- print("my sdis is "..sdis.LINK)
  rec.update_field("SDIS","LUA:SI1.DISA")

  roff,stat,sev,ts,bla=rec.retrieve_field("ROFF")
  print("before lopr is "..roff.." stat="..stat.." sev="..sev.." timestamp="..ts)

  rec.update_field("ROFF",7)
  rec.update_field("ROFF",1.23)
  rec.update_field("DESC","my desc11!1!eleven")

  roff=rec.retrieve_field("ROFF")
  print("after roff is"..roff)

  return luaiocsup.LUASUCCESS
end

function special_linconv(rec,after)
  print("Lua AO3 special_linconv")
  print(after)
  return 0,"bla"
end

print("ao3.lua")

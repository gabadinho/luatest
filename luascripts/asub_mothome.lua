print("LOADING FILENAME ASUB_MOTHOME.LUA")

function init_record(rec)
  print(rec.recordName())
end

--function motor_home(rec)
--  print("PROC_SUB_RECORD!!!")
--  -- rec.updateField("SCAN",0)  -- USE CONSTANT!!!
--  -- rec.updateField("SCAN",LUADEVSUP.menuScan.menuScanPassive)
--
--  efva=rec.retrieveField("VLDB")
--  print(efva)
--
--  -- rec.updateField("EFVA",0)
--  rec.updateField("VALB",2)
--  -- rec.updateField("VALB",2.2)
--
--  efva=rec.retrieveField("VLDB")
--  print(efva)
--
--  rec.updateField("SCAN",0)
--end


function motor_home(rec)
  print("MOTOR_HOME!!!")

  lschk=rec.retrieveField("A")
  print("LSCHK IS "..lschk)

  dmov=rec.retrieveField("B")
  print("DMOV IS "..dmov)


  rec.updateField("VALA",1)
  coroutine.yield(0)

  rec.updateField("VALA",2)
  coroutine.yield(0)

  rec.updateField("SCAN",0)
end

print("LOADING FILENAME ASUB_MOTHOME.LUA")

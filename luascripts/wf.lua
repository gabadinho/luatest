
-- WHY IS THE FOLLOWING NOT FOUND?!
-- RECHECK C-FUNCTION luadsPushMethod
function init_record(rec)
  print("Lua WD init_record ")
  print(rec)
  print(rec.recordName())
end

function read_wf(rec)
  print("Lua WF read_wf")
  -- -- LUADEVSUP.self.updateMyField("BPTR",{[0]=-1,2,3,4,[5]=9})
  -- LUADEVSUP.self.updateMyField("VAL",{[0]=-1,2,3,4,[5]=9})
  -- LUADEVSUP.self.updateMyField("NORD",5)

  rec.updateField("VAL",{[0]=-1,2,3,4,[5]=9})
  rec.updateField("NORD",5)

  -- return 0,{VAL={[0]=-1,2,3,4,[5]=9}}
  -- return 0,{BPTR={2,3,4},VAL=0}
  -- mywf=LUADEVSUP.self.retrieveMyField("VAL")
  mywf=rec.retrieveField("VAL")
  print(mywf)
  for i, v in ipairs(mywf) do
      print(i,v)
  end
  return 0
end

function del_record(rec)
  print("DELETE RECORD wf.lua")
  print(rec.recordName())
  return 0
end

print("wf.lua")

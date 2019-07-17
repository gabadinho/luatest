
function init_record(rec)
  print("Lua WAVEFORM init_record ")
  print(rec.record_name())
  return 0
end

function read_wf(rec)
  print("Lua WAVEFORM read_wf")
  print(rec.record_name())

  mywf=rec.retrieve_field("VAL")
  print(mywf)
  for i, v in ipairs(mywf) do
      print(i,v)
  end

  -- rec.updateField("VAL",{[0]=-1,2,3,4,[5]=9})
  -- rec.updateField("VAL",{[4]=-10})
  rec.update_field("VAL",{1,2,3,4,5,6,7,8,9})
  rec.update_field("NORD",6)

  -- rec.update_field("VAL",{[1]="idx1",[5]="idx5"})
  -- rec.update_field("NORD",6)

  return 0
end

print("waveform.lua")

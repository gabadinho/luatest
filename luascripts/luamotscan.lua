print("LOADING FILENAME LUAMOTSCAN.LUA")

function scanmot_init(rec)
  print(rec.recordName())
end

function scanmot(rec)
  print("SCAN MOTOR "..rec.recordName())
end

print("LOADED FILENAME LUAMOTSCAN.LUA")

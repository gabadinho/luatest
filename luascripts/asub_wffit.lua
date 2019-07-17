print("LOADING FILENAME ASUB_WFFIT.LUA")

local alien=require "alien"
local lib_wffit=alien.load("/home/gabadinho/SoftDev/fitgsl/libwffit.so")
local fun_wf_fit=lib_wffit.wf_fit
fun_wf_fit:types{"int","pointer","pointer","ref double","ref double",ret="int"}

function init_record(rec)
  print(rec.recordName())
  -- CONFIRM THAT THE WAVEFORM TYPES ARE FLOAT 32b!!!
end

function asub_wffit(rec)
  print("WAVEFORM FIT!!!")

  num_points=rec.retrieveField("A")

  xs=alien.array("float",rec.retrieveField("B"))
  ys=alien.array("float",rec.retrieveField("C"))

  r,center,peak=fun_wf_fit(num_points,xs,ys,0,0)

  rec.updateField("VALA",center)
  rec.updateField("VALB",peak)
end

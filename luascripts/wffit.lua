-- print("Loading "..arg[0])

local alien=require "alien"
local lib_wffit=alien.load("/home/gabadinho/SoftDev/fitgsl/libwffit.so")
local fun_wf_fit=lib_wffit.wf_fit
fun_wf_fit:types{"int","pointer","pointer","ref double","ref double",ret="int"}

function wffit_init(rec)
end

function wffit_proc(rec)
  luaiocsup.ioclog_info("Fitting!")
  result,center,peak=0,0.0,0.0
  num_points=rec.retrieve_field("C")
  if num_points>0 then
    local xs=alien.array("float",rec.retrieve_field("A"))
    local ys=alien.array("float",rec.retrieve_field("B"))
    result,center,peak=fun_wf_fit(num_points,xs.buffer,ys.buffer,0,0)
  end

  rec.update_field("VALA",center)
  rec.update_field("VALB",peak)
  rec.update_field("VALC",math.floor(result))
end

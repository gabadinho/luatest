-- print("Loading "..arg[0])

x={}; y={}

function x.init_record(rec)
  rec.update_field("VAL",{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20})
  rec.nord(20)
end

function y.init_record(rec)
  rec.update_field("VAL",{0.1,0.2,0.3,1,10,20,30,40,400,950,1000,600,40,30,20,10,1,0.3,0.1,0.1})
  rec.nord(20)
end


u={}
function u.read_wf(rec)
  v=rec.retrieve_field("VAL")
  for index,value in pairs(v) do
    print("i="..index.." v="..value)
    end
end

s={}
function s.read_wf(rec)
  v=rec.retrieve_field("VAL")
  for index,value in pairs(v) do
    print("i="..index.." v="..value)
    end
  -- rec.update_field("VAL",{"xpto 1","abcd 2"})
  rec.update_field("VAL",{123.1,456.2})
  -- rec.update_field("VAL",{123,456})
  -- rec.nord(2)
end

x={}
y={}

function x.init_record(rec)
  rec.update_field("VAL",{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20})
  rec.update_field("NORD",20)
end

function y.init_record(rec)
  rec.update_field("VAL",{0.1,0.2,0.3,1,10,20,30,40,900,1000,1000,900,40,30,20,10,1,0.3,0.1,0.1})
  rec.update_field("NORD",20)
end

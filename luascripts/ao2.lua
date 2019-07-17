--function init_sub_record(aluasub)
--  print("INIT_SUB_RECORD!!!")
--end

--function proc1(aluasub)
function proc1(rec)
  print("PROC_SUB_RECORD!!!")
  rec.updateField("VALA",{[0]=-10,20,30,40,[6]=90})
  -- LUADEVSUP.self.updateMyField("VALA",7)
  -- LUADEVSUP.self.updateMyField("A",{[0]=1,2,3,4,[5]=9})
  rec.updateField("A",{[0]=10,20,30,40,[5]=90})
  print("AFTER updateMyField")
end


-- WHY IS THIS BEING CALLED IF IN REC.INSTANTIATION WE HAVE IN='init_sub_record',SN='proc1'
-- ?!?!?!
function init_record(rec)
  print("************************************ Lua AO init_record 2")
  print(rec.recordName())
  -- return 1,2,3
end

function write_ao(ao,param2)
  print("Lua AO write 2")
  print("PACT IS "..ao.PACT)
  if (param2~=nil) then
    print("param2 IS "..param2)
  end
  -- return {VAL=1,PACT=2}
  -- return 0,{VAL=1},"bla"
  LUADEVSUP.scanIoRequest("XPTO")
  return 0,{VAL=70}
  -- return 0,fun1,1,"aaa"

  --
  -- if (ao.PACT==1) then
  --  print("IF CLAUSE")
  --   return 0,{PACT=0}
  -- else
  --   print("ELSE CLAUSE")
  --   return 0,{PACT=1},fun2,333
  -- end
end

function fun1(a,b)
  print("I am fun1!")
  print("Parameters are "..a.." "..b)
  return {PACT=0}
end

function fun2(a)
  print("I am fun2!")
  print("Parameters are "..a)
  return(21)
  -- coroutine.yield({PACT=1})
end

function writeA(ao,async_args)
  print("Lua AO write 2 A")
  print("PACT IS "..ao.PACT)
  -- print("CMD ARGS ARE "..LUADEVSUP._arg["LUA:AO8"])
  print("CMD ARGS ARE "..LUADEVSUP._args["LUA:AO8"][0])

  if (ao.PACT==0) then
    return 0,{},fun1,1,"aaa"
  else
    -- return 0,{PACT=0}
    return async_args
  end
end

function special_linconv(ao)
end

ao2 = {
  write_ao=writeA,
  init_record=function(ao)
        -- print("ANONYMOUS"..ao.BLA)
        print("ANONYMOUS")
       end,
}

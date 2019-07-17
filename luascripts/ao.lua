-- print(package.cpath)


--- XXX

-- require "package"
-- package.cpath=package.cpath..";/home/jg/Develop/Lua/lua-5.3.0/src/?.so"

-- local exec = require "tek.lib.exec"

-- local exec = require "tek.lib.exec"

-- cqueues = require "cqueues"
-- thread = require "cqueues.thread"

-- function thread1()
--   exec.sleep(10000)
--   print("thread1.before")
--   print("THREAD "..exec.getname())
--   print("thread1.after")
-- end

 function thread2()
   print("thread2.before")
   cqueues.sleep(10.0)
   print("thread2.after")
 end

function init_recordX()
  print("Lua AO init_record ")
  print(coroutine.running())
  -- print("Lua AO init_record "..ao.OUT)
  print("description is "..ao.DESC)
  print("disv is "..ao.DISV)

  LUADEVSUP.scanIoInit("XPTO")

  -- return {"val","out"},0
  -- return {"VAL","LOPR","HOPR"}
end

-- function bla()
--   local exec = require "tek.lib.exec"
--   print("bla before")
--   exec.sleep(2000)
--   print("bla after")
-- end

function write_aoX(ao)
  -- local exec = require "tek.lib.exec"
  -- print("THREAD "..exec.getname())
  -- exec.run(bla)
  -- exec.sleep(1000)
  -- print("T1")
  -- exec.run(thread1)
  -- exec.run(nil)
  -- cqueues.new()
  -- thread.start(function() print "BLA BLA BLA BLA BLA" end)
  -- thread.start(thread2)
  print("Lua AO write_ao "..ao.VAL)
  print(coroutine.running())

  -- my_closure()

  -- print("_SELF: "..LUADEVSUP._self["LUA:AO2"].retrieveMyField)
  -- LUADEVSUP._self["LUA:AO2"].retrieveMyField()
  LUADEVSUP.self.updateMyField("LOPR",2)
  -- LUADEVSUP.self.retrieveMyField("HOPRX")

  -- print("MENU IVOA PEEK: "..menuIvoa.menuIvoaSet_output_to_IVOV)
  -- print("MENU IVOA PEEK2: "..menuIvoa.CHOISES[1])
  -- print("LUASS_DBMENU PEEK: "..LUASS_DBMENU["LUA:AO1.IVOA"].CHOISES[3])
 
  print("MENU IVOA PEEK3: "..LUADEVSUP.menuIvoa.menuIvoaSet_output_to_IVOV)
  print("MENU IVOA PEEK4: "..LUADEVSUP.menuIvoa.CHOISES[0])
  print("MENU IVOA PEEK4: "..LUADEVSUP.menuIvoa.CHOISES[1])
  print("MENU IVOA PEEK4: "..LUADEVSUP.menuIvoa.CHOISES[2])
  -- THE FOLLOWING IS CRASHING THE SCRIPT!!!
  -- print("MENU DBMENU PEEK1: "..LUADEVSUP.DBMENU["LUA:AO1.IVOA"].CHOISES[-1])

  -- THE FOLLOWING IS CRASHING THE SCRIPT!!!
  -- print("MENU DBMENU PEEK2: "..LUADEVSUP.DBMENU["LUA:AO1.IVOA"].menuIvoaSet_output_to_IVOV)
 
  -- coroutine.yield()
  print("BEFORE YIELD")
  -- coroutine.yield({HOPR="10",DESC="MYDESC!"})

  -- what parameters does luass send back from the yield?!
  -- ao=coroutine.yield()
  aonew=coroutine.yield(0,{VAL=1})

  print("AFTER YIELD")
  print("Lua AO write_ao AFTER YIELD "..ao.VAL)
  print("Lua AO write_ao AFTER YIELD "..aonew.VAL)

  -- The following method should not exist anymore after init stage!
  -- LUADEVSUP.scanIoInit("XYZ")

  print(coroutine.running())
  -- return {HOPR="10",VAL=1.1,DESC="MYDESC!",DISV=2,HSV=1},0
  return 0,{VAL=2,DISV=2,HSV=1}
end

function special_linconvX(ao)
end

aoClass = {
  init_record=init_recordX,
  write_ao=write_aoX,
  special_linconv=special_linconvX
} 

function write_ao2(ao)
  print("WRITE_AO2 A")
  -- return
  coroutine.yield(0)
  print("WRITE_AO2 B")
  coroutine.yield(0,{})
  print("WRITE_AO2 C")
  return 0
end
ao2 = {
  write_ao=write_ao2,
} 


print("THIS FILENAME IS "..argX[0])
-- print("FIRST PARAM IS "..arg[1])
---print("ao.lua ")

--aoClass.init_record({out='xxx'})


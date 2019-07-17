local llthreads = require "llthreads2"
local alien = require "alien"

luaiocsup.scanio_init("iobla")

function init1(rec)
  print("===========================> Lua ASUB init1 <============================")
  print(rec.record_name())
end

function proc1(rec)
  print("Lua ASUB proc1")
  print(rec.record_name())

  rec.update_field("VALA",{[0]=99})

  -- t1:start()
  t2:start()

  return 0
 end

function callback0(p1,p2)
  print("callback0 "..p1.." "..p2)
  -- return "bla2",4
end

function callback1(rec,p1,p2,rec2)
  print("callback1 "..p1.." "..p2)
  print(rec.record_name())
  return "bla1",3
end

function callback2(p1,p2,rec)
  print("callback2 "..p1.." "..p2)
  print(rec.record_name())
  return 4,"bla5" -- THIS WILL MAKE THAT proc3 HAS rec=nil !!! THEN FAILD IN rec.retrieveField(PACT)!!!
end

function callback3()
  print("callback3!!!!!!!!!!!!!!!!!!!!!!!!!!!")
end

function proc2(rec)
  print("Lua ASUB proc2 - 1 ")
  print(luaiocsup.self.record_name())
  print(rec)
  coroutine.yield(0)

  print("Lua ASUB proc2 - 2 ")
  print(rec.record_name())
  rec.update_field("PACT",1)
  -- p1,p2=coroutine.yield(0,callback0,"param1",45) -- p1 IS BEING THE RECORD!!!
  p1,p2=coroutine.yield(0,callback1,"param1",45,rec) -- p1 IS BEING THE RECORD!!!
  -- p1,p2,p3=coroutine.yield(0,callback0,"paramX",68) -- p1 is rec!!!
  -- p1,p2=coroutine.yield(0,callback3) -- p1 IS BEING THE RECORD!!!
  print("yield() returning the following")
  print(p1)
  print(p2)
  -- print(p3)
  print(rec.record_name())
  -- print(p1.recordName())

  print("Lua ASUB proc2 - 3 ")
  print(luaiocsup.self.record_name())

  rec.update_field("PACT",0)
  return 0
 end

function proc3(rec,p1,p2)
  print("Lua ASUB proc3 - 1 ")
  print(rec)
  print(p1)
  print(p2)
  print(luaiocsup.self.record_name())

  pact=rec.retrieve_field("PACT")

  if pact==0 then
    rec.update_field("PACT",1)
    print("SCHEDULING CALLBACK!!!")
    -- return 0,callback2,444,"param2",rec

    p1,p2=coroutine.yield(0,callback3) -- p1 IS BEING THE RECORD!!!
    print("yield() returning the following")
    print(p1)
    print(p2)
  end

  print("FINISHING UP!!!")
  rec.update_field("PACT",0)
  return 0
end

print("asub.lua")

luaiocsup.scanio_init("iobla")

print(luaiocsup)
print(luaiocsup.bind_luaiocsup)
print(llthreads.new)
t1 = llthreads.new([[
  print("print_detached_thread:", ...)
  print(luaiocsup)
  print(llthreads)
]], ...)

t2 = llthreads.new([[
  print("print_detached_thread2 :", ...)
  local farg = {...}
  local fn = farg[1]
  local ioid = farg[2]
  print(fn)
  print("BEFORE")
  fn()
  print("AFTER")
  print(luaiocsup)
  luaiocsup.ioclog_info("INSIDE WORKER THREAD!!!")
  print(luaiocsup.scanio_init)
  print(luaiocsup.scanio_request)
  luaiocsup.scanio_request(ioid,"KEEEEEEEEEEEEE")
  luaiocsup.db_process("LUA:AI1")
]], luaiocsup.bind_luaiocsup, "iostringin")

-- print("Loading "..arg[0])

local llthreads = require "llthreads2"

local SCANIO_ID = "wsecho"
luaiocsup.scanio_init(SCANIO_ID)

thread_code = [[
  local websocket=require "http.websocket"

  local farg = {...}
  local init_fn  = farg[1]
  local orig_str = farg[2]
  local io_evid  = farg[3]

  init_fn() -- Do luaiocsup bindinds

  echoed=""
  if orig_str:len()>0 then
    local ws=websocket.new_from_uri("wss://echo.websocket.org/")
    ws:connect()
    ws:send(orig_str)
    local data=ws:receive()
    ws:close()
    echoed=data
  end

  luaiocsup.scanio_request(io_evid, echoed)
]]

function send_string(rec)
  local t = llthreads.new(thread_code, luaiocsup.bind_luaiocsup, rec.retrieve_field("VAL"), SCANIO_ID)
  t:start()
end
strout = {}
strout.write_stringout = send_string

function receive_string(rec,echoed)
  if echoed~=nil then
    rec.update_field("VAL",echoed)
  end
end
strin = {}
strin.read_stringin = receive_string
strin.get_ioint_info = function(rec,cmd)
  return SCANIO_ID
end

-- print("Loading "..arg[0])

local websocket=require "http.websocket"

function wsecho_callback(rec,orig)
  echoed=""
  if orig:len()>0 then
    local ws=websocket.new_from_uri("wss://echo.websocket.org/")
    ws:connect()
    ws:send(orig)
    local data=ws:receive()
    ws:close()
    echoed=data
  end
  return echoed
end

function wsecho_proc(rec,echoed)
  if rec.pact()==0 then
    rec.pact(1)
    local text=rec.retrieve_field("A")
    -- Record will automatically get re-processed at end of returned callback
    return 0,wsecho_callback,text
  end
  if echoed~=nil then
    rec.update_field("VALA",echoed)
  end
  rec.pact(0)
end

-- http://www.websocket.org/echo.html

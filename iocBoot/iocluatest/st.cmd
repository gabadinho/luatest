#!../../bin/linux-x86_64/luatest

## You may have to change luatest to something else
## everywhere it appears in this file

< envPaths

cd "${TOP}"

## Register all support components
dbLoadDatabase "dbd/luatest.dbd"
luatest_registerRecordDeviceDriver pdbbase

epicsEnvSet ("STREAM_PROTOCOL_PATH", "${TOP}/streamcfg")

lisConfigure("${TOP}/luascripts",2,20)

# Configure Smaract MCS in serial port
drvAsynSerialPortConfigure ("MCS1","/dev/ttyS0")
asynSetOption ("MCS1", 0, "baud", "9600")
asynSetOption ("MCS1", 0, "bits", "8")
asynSetOption ("MCS1", 0, "parity", "none")
asynSetOption ("MCS1", 0, "stop", "1")
asynSetOption ("MCS1", 0, "clocal", "Y")   # Y = ignore DTR/DSR
asynSetOption ("MCS1", 0, "crtscts", "N")  # N = ignore RTS/CTS
asynOctetSetInputEos("MCS1", -1, "\n")
asynOctetSetOutputEos("MCS1", -1, "\n")

## Load record instances
dbLoadRecords("db/lisstringout.db","RECORD=DEVSUP:DATE,DTYP=date,OUT='@%x'")
#dbLoadRecords("db/lisstringout.db","RECORD=DEVSUP:DATE2,DTYP=date2,OUT='@%x'")

dbLoadRecords("db/lisstringout.db","RECORD=LUA:DATE,DTYP=lua,OUT='@strout_date.lua'")

dbLoadRecords("db/wsecho.db","RECORD=LUA:WSECHO")
dbLoadRecords("db/wsecho_threaded.db","RECORD=LUA:ECHOTHREAD")

dbLoadRecords("db/liswaveform.db","RECORD=LUA:XVALUES,NELM=20,FTVL=DOUBLE,INP='@wfinit.lua @table=x'")
dbLoadRecords("db/liswaveform.db","RECORD=LUA:YVALUES,NELM=20,FTVL=DOUBLE,INP='@wfinit.lua @table=y'")
dbLoadRecords("db/softwf.db","RECORD=FIT:X,NELM=20,FTVL=DOUBLE,INP=LUA:XVALUES")
dbLoadRecords("db/softwf.db","RECORD=FIT:Y,NELM=20,FTVL=DOUBLE,INP=LUA:YVALUES")
dbLoadRecords("db/wffit.db","RECORD=LUA:WFFIT,X-AXIS=FIT:X,NOX=20,Y-AXIS=FIT:Y,NOY=20,NO=20")

dbLoadRecords("db/asyn.db","SYSTEM=SMARACT1,DESC=SmaractCtrl,terminal=MCS1,ADDR=0")
cd "${TOP}/db"
dbLoadTemplate("smaract.db")
cd "${TOP}"

cd "${TOP}/iocBoot/${IOC}"

iocInit

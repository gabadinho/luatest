TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = luatest
# luatest.dbd will be created and installed
DBD += luatest.dbd

# luatest.dbd will be made up from these files:
luatest_DBD += base.dbd

# Include dbd files from all support applications:
#luatest_DBD += xxx.dbd

luatest_DBD += formatDate.dbd formatDate2.dbd

luatest_DBD += asyn.dbd
luatest_DBD += drvAsynIPPort.dbd
luatest_DBD += drvAsynSerialPort.dbd
luatest_DBD += devEpics.dbd

luatest_DBD += stream.dbd

luatest_DBD += luaiocsup.dbd

# Add all the support libraries needed by this IOC
#luatest_LIBS += xxx

luatest_LIBS += asyn
luatest_LIBS += stream
luatest_LIBS += luaiocsup

# luatest_registerRecordDeviceDriver.cpp derives from luatest.dbd
luatest_SRCS += luatest_registerRecordDeviceDriver.cpp formatDate.c formatDate2.c

# Build the main IOC entry point on workstation OSs.
luatest_SRCS_DEFAULT += luatestMain.cpp
luatest_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#luatest_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
luatest_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE


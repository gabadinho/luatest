TOP=../..
include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE

#----------------------------------------------------
#  Optimization of db files using dbst (DEFAULT: NO)
#DB_OPT = YES

#----------------------------------------------------
# Create and install (or just install) into <top>/db
# databases, templates, substitutions like this
#DB += xxx.db
#DB += lisai.db
#DB += lisao.db
#DB += lisstringin.db
#DB += liswave.db
#DB += lisasub.db



DB += lisstringout.db
DB += liswaveform.db

DB += wsecho.db
DB += wsecho_threaded.db

DB += softwf.db
DB += wffit.db

DB += luamothome.db

DB += asyn.db
DB += SMARACTMCSBASE.template
DB += SMARACTMCSnV2.template
DB += smaract.db


#----------------------------------------------------
# If <anyname>.db template is not named <anyname>*.template add
# <anyname>_template = <templatename>

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE


#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <time.h>

#include "epicsExport.h"
#include "devSup.h"
#include "stringoutRecord.h"

#define DEFAULT_FORMAT "%x"

static long luatestAddFormatDate(struct dbCommon *precord);
static long luatestDelFormatDate(struct dbCommon *precord);
static long luatestInitFormatDate(int phase);
static long luatestProcFormatDate(stringoutRecord *prec);

/* Extended device-support structure */
static struct dsxt extdevsupFormatDate = {
    luatestAddFormatDate,luatestDelFormatDate
};

/* Device-support structure */
struct {
  long num;
  DEVSUPFUN  report;
  DEVSUPFUN  init;
  DEVSUPFUN  init_record;
  DEVSUPFUN  get_ioint_info;
  DEVSUPFUN  write;
  DEVSUPFUN  special_linconv;
} devsupFormatDate2 = {
  6, /* space for 6 functions */
  NULL,
  luatestInitFormatDate,
  NULL,
  NULL,
  luatestProcFormatDate,
  NULL
};
epicsExportAddress(dset,devsupFormatDate2);

static long luatestAddFormatDate(struct dbCommon *precord) {
  stringoutRecord *prec=(stringoutRecord *)precord;
  prec->val[0]=0; /* Clear VAL field */
  return 0;
}
static long luatestDelFormatDate(struct dbCommon *precord) {
  return 0;
}

static long luatestInitFormatDate(int phase) {
  if (phase==0) {
    devExtend(&extdevsupFormatDate);
  }
  return 0;
}

static long luatestProcFormatDate(stringoutRecord *prec) {
  time_t t;
  struct tm tm;
  char *format;

  t=time(NULL);
  localtime_r(&t,&tm);

  format=DEFAULT_FORMAT;
  if ((prec->out.text) && (strlen(prec->out.text)>1) && (prec->out.text[0]=='@')) {
    format=&(prec->out.text[1]); /* Bypass initial '@' character in OUT field */
  }
  strftime(prec->val,sizeof(prec->val),format,&tm);

  return 0; /* 0 mean processing went fine */
}

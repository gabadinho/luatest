#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <time.h>

#include "epicsExport.h"
#include "devSup.h"
#include "stringoutRecord.h"

#define DEFAULT_FORMAT "%x"

static long luatestProcFormatDate(stringoutRecord *prec);

/* Device-support structure */
struct {
  long num;
  DEVSUPFUN  report;
  DEVSUPFUN  init;
  DEVSUPFUN  init_record;
  DEVSUPFUN  get_ioint_info;
  DEVSUPFUN  write;
  DEVSUPFUN  special_linconv;
} devsupFormatDate = {
  6, /* space for 6 functions */
  NULL,
  NULL,
  NULL,
  NULL,
  luatestProcFormatDate,
  NULL
};
epicsExportAddress(dset,devsupFormatDate);

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

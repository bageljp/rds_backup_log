#!/bin/bash

func_usage() {
  echo "Usage: `basename $0` {db_instance_identifier} {log_dir}"
  return 0
}

if [ $# -lt 2 ]; then
  func_usage
  exit 1
fi

RDS_ID="$1"
DIR_LOG="$2"
DIR_SCRIPT="/path/to"
SH_DOWNLOAD="${DIR_SCRIPT}/rds-download-log.rb"
SH_RENAME="${DIR_SCRIPT}/rds-rename-log.bash"
ROTATE="31"
DATE="`date +%Y%m%d`"
DATE_OLD=`date --date "${ROTATE} day ago" +%Y%m%d`


[ -d ${DIR_LOG} ] || mkdir -p ${DIR_LOG}

# log download
${SH_DOWNLOAD} ${RDS_ID} ${DIR_LOG}
ret=$?
if [ ${ret} -ne 0 ]; then
  echo "log download failure."
  exit 2
fi

# log rename
${SH_RENAME} ${DIR_LOG}
ret=$?
if [ ${ret} -ne 0 ]; then
  echo "log download failure."
  exit 3
fi

# log rotate
cd ${DIR_LOG}
[ -d ${DATE} ] || mkdir -p ${DATE}
mv -f mysql-* ${DATE}
[ -d ${DATE_OLD} ] && rm -rf ${DATE_OLD:-/nodefined}

exit 0

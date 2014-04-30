#!/bin/bash

DIR_LOG="$1"
LOG_RDS="${DIR_LOG}/rds_events.log"
export AWS_DEFAULT_REGION="ap-northeast-1"
CMD_AWS="/usr/bin/aws"
YEAR_START="`date --date '2 day ago' +%Y`"
YEAR_END="`date --date '1 day ago' +%Y`"
MONTH_START="`date --date '2 day ago' +%m`"
MONTH_END="`date --date '1 day ago' +%m`"
DAY_START="`date --date '2 day ago' +%d`"
DAY_END="`date --date '1 day ago' +%d`"
TIME_START="${YEAR_START}-${MONTH_START}-${DAY_START}T15:00:00"
TIME_END="${YEAR_END}-${MONTH_END}-${DAY_END}T14:59:59"
ROTATE="62"
DATE_OLD=`date --date "$((${ROTATE}+1)) day ago" +%Y%m%d`

func_usage() {
  echo "Usage: `basename $0` {log_dir}"
  return 0
}

# check
if [ $# -lt 1 ]; then
  func_usage
  exit 1
fi

# mkdir
[ -d ${DIR_LOG} ] || mkdir -p ${DIR_LOG}

# get event
${CMD_AWS} rds describe-events --start-time ${TIME_START} --end-time ${TIME_END} >> ${LOG_RDS}.`date +%Y%m%d` 2>&1
ret=$?

[ -f ${LOG_RDS}.${DATE_OLD:-/nodefined} ] && rm -f ${LOG_RDS}.${DATE_OLD:-/nodefined}

exit ${ret}


#!/bin/bash

LOG_PATH="/usr/nacos/bin/logs"
TODAY=$(date "+%Y-%m-%d")
LOG_FILE_PREFIX="access_log."
LOG_FILE_SUFFIX=".log"
ONE_MONTH_AGO_SECONDS=`date -d "30 day ago" "+%s"`

cd $LOG_PATH
# clean all the logs before $RETAIN_DAYS ago
for log_file in $LOG_PATH/*
do
    FILE_DATE=`echo $log_file | awk -F. '{print $2}'`
    if [ -e $log_file -a  `date -d $FILE_DATE "+%s"` -lt $ONE_MONTH_AGO_SECONDS ]
    then
        rm -rf $log_file
    fi
done



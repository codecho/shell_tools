#!/bin/bash

# secure log path, this is centos 7, and it may be different in other os
SECURE_LOG_PATH="/var/log/secure"
# illegal ip file path, replace with your path
IP_LIST_PATH="/usr/shell_study/illegal_ip_list.txt"
# hosts.deny path
HOSTS_DENY_PATH="/etc/hosts.deny"
# hosts.deny backup path
HOSTS_DENY_BAK_PATH="/etc/hosts.deny.bak"
# cron task log path
CRON_TASK_LOG_PATH="/usr/shell_study/cron_task.log"
# the number of added illegal ips
IP_COUNT=0

# clean old ip file
if [ -e $IP_LIST_PATH ]
then
    cat /dev/null > $IP_LIST_PATH
fi

# extract illegal ip
cat $SECURE_LOG_PATH | grep "Failed password" | awk -F "from" '{print $2}' | awk -F "port" '{print $1}' | sort | uniq -c > $IP_LIST_PATH

# reset hosts.deny, since we check the ip whether existed in hosts.deny, so this step can be removed 
#if [ -e $HOSTS_DENY_BAK_PATH ]
#then
#    cat $HOSTS_DENY_BAK_PATH > $HOSTS_DENY_PATH
#fi

# add illegal ip to hosts.deny which appears more than once
while read IP_LINE
do
    COUNT=`echo $IP_LINE | awk -F " " '{print $1}'`
    IP=`echo $IP_LINE | awk -F " " '{print $2}'`
    if [ $COUNT -ge 2 -a `grep -c $IP $HOSTS_DENY_PATH` -eq 0 ]
    then
        let IP_COUNT++
        echo "sshd:$IP" >> $HOSTS_DENY_PATH
    fi
done < $IP_LIST_PATH

# add cron task log
echo "$(date "+%Y-%m-%d %H:%M:%S"): added $IP_COUNT illegal ips" >> $CRON_TASK_LOG_PATH

### deny_illegal_ip.sh
- backup hosts.deny
  ```bash
  cp /etc/hosts.deny /etc/hosts.deny.bak
  ```
  
- create illegal_ip file
  ```bash
  touch /xxx/illegal_ip_list.txt
  ```
  
- create cron_task log file
  ```bash
  touch /xxx/cron task.log
  ```
  
- create cron task, execute the script every 30 minutes
  ```bash
  crontab -e

  */30 * * * * /xxx/deny_illegal_ip.sh
  ```
---


### clean_nacos_logs.sh
- replace $LOG_PATH and $ONE_MONTH_AGO_SECONDS in shell
  ```
  LOG_PATH="/usr/nacos/bin/logs"
  ONE_MONTH_AGO_SECONDS=`date -d "30 day ago" "+%s"`
  ```
- create cron task, execute the script every day
  ```bash
  crontab -e
  
  0 0 * * * /usr/shell_study/clean_nacos_logs.sh
  ```



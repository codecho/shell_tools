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

- replace IP_LIST_PATH HOSTS_DENY_BAK_PATH CRON_TASK_LOG_PATH with yours in deny_illegal_ip.sh

- create cron task, execute the script every 30 minutes
  ```bash
  crontab -e

  */30 * * * * /xxx/deny_illegal_ip.sh
```

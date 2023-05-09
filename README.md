>这是一个shell脚本仓库，里面有很多实用的功能

#### 功能列表
- 禁止恶意ip登录
- 定时清除nacos产生的日志
- 通过一行脚本命令切换JDK版本
---

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
  touch /xxx/cron/task.log
  ```
  
- create cron task, execute the script every 30 minutes
  ```bash
  crontab -e

  */30 * * * * /xxx/deny_illegal_ip.sh
  ```
---


### clean_nacos_logs.sh
- replace $LOG_PATH and $ONE_MONTH_AGO_SECONDS in shell
  ```shell
  LOG_PATH="/usr/nacos/bin/logs"
  ONE_MONTH_AGO_SECONDS=`date -d "30 day ago" "+%s"`
  ```
- create cron task, execute the script every day
  ```bash
  crontab -e
  
  0 0 * * * /usr/shell_study/clean_nacos_logs.sh
  ```
---

### switch_jdk.sh
- replace $my_versions
  ```shell
  # here are jdk versions you installed
  my_versions=([8]="/usr/java/jdk" [17]="/usr/java/jdk17")
  ```
- execute the script with target jdk version
  ```bash
  source switch_jdk.sh version
  or
  . switch_jdk.sh version
  ```


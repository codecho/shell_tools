#!/bin/sh

# here are jdk versions you installed
my_versions=([8]="/usr/java/jdk" [17]="/usr/java/jdk17")

if [ -z ${my_versions[$1]} ]
then
    echo "jdk$1 does not exist! please check whether you installed"
else
    # 79:export JAVA_HOME=/usr/java/jdk
    line_number=`grep "export JAVA_HOME" -n profile | awk -F ":" '{print $1}'`
    
    sed -i "79c export JAVA_HOME=${my_versions[$1]}" /etc/profile
   
    source /etc/profile 
    
    echo "switch to jdk$1 successfully!"
  
    java -version
fi


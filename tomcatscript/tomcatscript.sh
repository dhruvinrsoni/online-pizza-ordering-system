#!/bin/bash
apt update && apt install apt-utils -y && apt install socat -y && socat tcp-listen:3306,fork TCP:10.5.0.5:3306 &
catalina.sh run
#socat UNIX-LISTEN:/var/lib/mysql/mysql.sock,fork,reuseaddr,unlink-early,user=mysql,group=mysql,mode=777 TCP:10.5.0.5:3306 &
#socat TCP:10.5.0.5:3306 &
#socat tcp-listen:3306,fork TCP:10.5.0.5:3306 &

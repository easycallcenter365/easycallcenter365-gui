#!/bin/sh

set -e

if [ ! "$(which java)" ]; then
  echo "Java not found. 请安装jdk1.8"
  exit 1
fi

#获取sh脚本文件目录
SH_PATH=$(
  cd "$(dirname "$0")"
  pwd
)
#进入脚本文件目录
cd $SH_PATH

#获取项目根目录
cd ..
BASE_PATH=$(pwd)

#java路径
JAVA=$(which java)
#项目名称
NAME=@project.artifactId@
#进程文件pid
PIDFILE=$BASE_PATH/pid/$NAME.pid

DAEMON=$JAVA
DAEMON_OPTS=
#启动文件
JAR_FILE=$BASE_PATH/lib/@project.build.finalName@.jar
#以服务方式启动
DAEMON_OPTS="${DAEMON_OPTS} -server"
#启动最小内存
DAEMON_OPTS="${DAEMON_OPTS} -Xms256m"
#启动最大内存
DAEMON_OPTS="${DAEMON_OPTS} -Xmx512m"
#配置文件路径
DAEMON_OPTS="${DAEMON_OPTS} -Dspring.config.additional-location=file:${BASE_PATH}/conf/"
#设置项目路径
DAEMON_OPTS="${DAEMON_OPTS} -Duser.dir=${BASE_PATH}/"
#指定服务级别临时文件目录
DAEMON_OPTS="${DAEMON_OPTS} -Djava.io.tmpdir=${BASE_PATH}/tmp/"
#可执行文件目录
DAEMON_OPTS="${DAEMON_OPTS} -jar ${JAR_FILE}"

#环境变量
#export PATH="${PATH:+$PATH:}/usr/sbin:/sbin"

case "$1" in
start)
  echo -n "Starting daemon: "$NAME" "
  # --verbose --background --make-pidfile
  bin/start-stop-daemon --start --background --verbose --pidfile $PIDFILE --make-pidfile --exec "$DAEMON" -- $DAEMON_OPTS
  echo "."
  ;;
stop)
  echo -n "Stopping daemon: "$NAME
  bin/start-stop-daemon --stop --verbose --oknodo --retry 30 --pidfile $PIDFILE
  echo "."
  ;;
restart)
  echo -n "Restarting daemon: "$NAME
  bin/start-stop-daemon --stop --verbose --oknodo --retry 30 --pidfile $PIDFILE
  bin/start-stop-daemon --start --background --verbose --pidfile $PIDFILE --make-pidfile --exec $DAEMON -- $DAEMON_OPTS
  echo "."
  ;;
help)
  echo -n "help: "$NAME
  bin/start-stop-daemon --help
  echo "."
  ;;
*)
  echo "Usage: "$1" {start|stop|restart|help}"
  exit 1
  ;;
esac

exit 0

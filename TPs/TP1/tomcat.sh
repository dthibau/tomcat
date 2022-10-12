#!/bin/sh
# Tomcat Startup Script

CATALINA_HOME=/home/david/FormationsTP/Tomcat/apache-tomcat-7.0.26; export CATALINA_HOME
JAVA_HOME=/usr/local/java; export JAVA_HOME
CATALINA_OPTS="-Xms512m -Xmx512m"; export CATALINA_OPTS
TOMCAT_OWNER=david; export TOMCAT_OWNER

start() {
        echo -n "Starting Tomcat:  "
        su $TOMCAT_OWNER -c $CATALINA_HOME/bin/startup.sh
        sleep 2
}
stop() {
        echo -n "Stopping Tomcat: "
        su $TOMCAT_OWNER -c $CATALINA_HOME/bin/shutdown.sh
}

# See how we were called.
case "$1" in
  start)
        start
        ;;
  stop)
        stop
        ;;
  restart)
        stop
        start
        ;;
  *)
        echo $"Usage: tomcat {start|stop|restart}"
        exit
esac 

#!/bin/bash -xe

exec &> /var/log/logmonitor.log

MONITORED_LOG=/var/log/continuous.log
TIME_CHECK=/var/log/.continuous.log.tc
POST_TO=$1

touch $TIME_CHECK
sleep 1
touch $MONITORED_LOG

while true; do
    if [[ -s "$MONITORED_LOG" && $MONITORED_LOG -nt $TIME_CHECK ]]; then
        curl --data-binary @$MONITORED_LOG
        touch $TIME_CHECK
    fi
    sleep 30
done
#!/bin/bash

# Start the run once job.
echo "Docker container has been started"

declare -p | grep -Ev 'BASHOPTS|BASH_VERSINFO|EUID|PPID|SHELLOPTS|UID' > /tmp/container.env

# Setup a cron schedule
echo "SHELL=/bin/bash
BASH_ENV=/tmp/container.env
* * * * * /usr/bin/python3 /changefields.py >> /var/log/cron.log 2>&1
# This extra line makes it a valid cron" > /tmp/scheduler.txt

crontab /tmp/scheduler.txt
cron -f

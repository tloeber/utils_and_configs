#!/bin/bash

LOG_PATH=/var/log/my_programs/auto-update/auto-update.log

{
   echo $date
   apt-get update
   apt-get upgrade -y
   apt-get autoclean
} >> $LOG_PATH 2>&1

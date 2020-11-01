#!/bin/bash

LOG_PATH=/var/log/my_programs/auto-update/auto-update.log

{
   echo $(date)
   echo ============

   apt-get update
   apt-get upgrade -y
   apt-get autoclean

   # Add blank line before next entry
   echo ""

} >> $LOG_PATH 2>&1

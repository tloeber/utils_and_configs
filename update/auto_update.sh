#!/bin/bash

LOG_PATH=/var/log/my_programs/auto-update/auto-update.log

{
   # Visual separation from previous log entry
   echo ""
   echo =====================================================================
   echo ""

   echo $(date) - ${BASH_SOURCE[0]}

   apt-get update
   apt-get upgrade -y
   apt-get autoclean

} >> $LOG_PATH 2>&1

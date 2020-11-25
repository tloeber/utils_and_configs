#!/bin/bash

LOG_PATH=/var/log/my_programs/update/auto_update.log
LOG_PATH_PREVIOUS=/var/log/my_programs/update/auto_update_previous.log

{
   # Visual separation from previous log entry
   echo ""
   echo =====================================================================
   echo ""
   echo $(date) - ${BASH_SOURCE[0]}
   echo ""
   # Add last log to previous logs
   cat $LOG_PATH >> $LOG_PATH_PREVIOUS
   
   echo "UPDATING:"
   apt-get update
   echo ""
   
   echo "UPGRADING:"
   apt-get upgrade -y
   echo ""

   echo "RUNNING AUTO-CLEAN:"
   apt-get autoclean

} > $LOG_PATH 2>&1

#!/bin/bash

log_path=/var/log/my_programs/auto-update/auto-update.log

echo $(date) > $log_path
apt-get update &>> $log_path
apt-get upgrade -y  &>> $log_path
apt-get autoclean &>> $log_path

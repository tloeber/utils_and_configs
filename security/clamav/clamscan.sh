LOG_FILE=/var/log/my_programs/clamav/clamscan.log
# Location where to copy infected files for further analysis
INFECTED_FILES_DIR=./infected_files

{
  echo $(date)
  clamscan --recursive \
    --infected --allmatch --remove=no \
    --copy=$INFECTED_FILES_DIR --exclude-dir=$INFECTED_FILES_DIR \
    --exclude-dir=^/sys/ --exclude-dir=^/proc/ --exclude-dir=^/dev/
} > $LOG_FILE 2>&1

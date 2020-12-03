## User defined variables
# Since multiple directories need to be backed up, put symlinks to them here
backup_origin="/home/thomas/directories_to_backup/"
backup_dir="/media/thomas/orico_black/hp_laptop"
# Logging
log_dir="/var/log/my_programs/backup"
log_path="${log_dir}/local.log"
log_path_prev="${log_dir}/local_prev.log"
error_path="${log_dir}/local_errors.log"
error_path_prev="${log_dir}/local_errors_prev.log"

## These generally should not have to be modified by user
backup_path="${backup_dir}/$(date '+%Y-%m-%d_%H:%M:%S')"
link_to_latest_backup="${backup_dir}/latest"

# Add log of last run to file containing all previous logs
cat $log_path >> $log_path_prev \
    || echo "No existing log_path file found."

cat $error_path >> $error_path_prev \
    || echo "No existing error_path file found."

{
    # Create directory for newest backup
    mkdir backup_path

    # -KL follows symlinks
    rsync -avKL --delete \
        $backup_origin \
        --link-dest $link_to_latest_backup \
        --exclude="*.cache" \
        $backup_path 

    # Update pointer to latest backup
    rm -rf $link_to_latest_backup
    ln -s $backup_path $link_to_latest_backup

} > $log_path 2> $error_path   
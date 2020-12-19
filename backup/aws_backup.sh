#!/bin/bash

# Keep name of S3 bucket out of version control (just in case)
destination_bucket_path=$(cat /home/thomas/projects/utils_and_configs/backup/config/backup_destination.txt)
# Explicitly specify user's home path, since Anacron runs script as root
home_path="/home/thomas"
# Directories to back up
backup_origins=("/etc" "$home_path" "$temp_local_backups_path")
aws_profile="b"

# Logging
log_dir="/var/log/my_programs/backup/aws"
log_path="${log_dir}/stdout.log"
log_path_prev="${log_dir}/stdout_prev.log"
error_path="${log_dir}/stderr.log"
error_path_prev="${log_dir}/stderr_prev.log"

# Add logs of last run to file containing all previous logs
{
	cat $log_path 
	echo "======================================================================="
	echo ""
} >> $log_path_prev || echo "No existing log_path file found."

{
	cat $error_path 
	echo "======================================================================="
	echo ""
} >> $error_path_prev || echo "No existing error_path file found."


# Write start time and filename to BOTH log and error file
echo "started at $(date) - ${BASH_SOURCE[0]}" | tee $log_path $error_path

{	
	
	for dir in "${backup_origins[@]}"; do
		# Add parent directory of original file to S3 as prefix.
		# Using AWS managed KMS key, so we don't have to provide a key ID.
		# Exclude programs, overly-long configs, secrets, etc.
		aws s3 sync "$dir" "s3://${destination_bucket_path}/ubuntu${dir}" \
			--storage-class=STANDARD_IA \
			--profile=$aws_profile \
			--exclude "${home_path}/.ICEauthority/*" \
			--exclude "${home_path}/.Xauthority/*" \
			--exclude "${home_path}/.cache/*" \
			--exclude "${home_path}/.aws*" \
			--exclude "${home_path}/.bash_history*" \
			--exclude "${home_path}/.config/google-chrome*" \
			--exclude "${home_path}/.gnupg*" \
			--exclude "${home_path}/.mozilla*" \
			--exclude "${home_path}/.vscode*" \
			--exclude "${home_path}/.password-store*" \
			--exclude "${home_path}/.pki*" \
			--exclude "${home_path}/.ssh*" \
			--exclude "${home_path}/.tmux_history*" \
			--exclude "${home_path}/Dropbox*" \
			--exclude "${home_path}/anaconda3*" \
			--exclude "${home_path}/aws*" \
			--exclude "${home_path}/directories_to_rsync*" \
			--exclude "${home_path}/snap*" \
			--exclude "*.git*" \
			--exclude "*.Rproj*" \
			--exclude "*.joblib.*" \
			--exclude "*.ipynb_checkpoints*" \
			--exclude "*.swp" \
			--sse aws:kms \
			--delete
			# --dryrun 			
	done

	echo "Finished at $(date)"
} > $log_path 2> $error_path   
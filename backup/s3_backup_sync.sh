#!/bin/bash

# Whole directories to back up
backup_origins=("/etc/" \
  "~/")
aws_profile="b"
log_path="/var/log/my_programs/backups/s3_backup_sync.log"
# Keep name of S3 bucket out of version control (just in case)
destination_bucket_path=$(cat config/backup_destination.txt)
# Explicitly specify user's home path, since Anacron runs it as root
home_path="/home/thomas"

{
	# Directories
	# -----------

	echo "started at $(date) - ${BASH_SOURCE[0]}" 
	echo "=================================================================="
	echo "Backing up whole directories to Standard IA:"
	for dir in "${backup_origins[@]}"; do
		aws s3 sync "$dir" "s3://${destination_bucket_path}${dir}" \
			--storage-class=STANDARD_IA \
			--profile=$aws_profile \
			--exclude "${home_path}/.aws*" \
			--exclude "${home_path}/.gnupg*" \
			--exclude "${home_path}/.password-store*" \
			--exclude "${home_path}/.pki*" \
			--exclude "${home_path}/.ssh*" \
			--exclude "${home_path}/Dropbox*" \
			--exclude "${home_path}/anaconda3*" \
			--exclude "${home_path}/aws*" \
			--exclude "${home_path}/snap*" \
			--exclude "*.git*" \
			--exclude "*.Rproj*" \
			--exclude "*.joblib.*" \
			--exclude "*.ipynb_checkpoints*" \
			--sse aws:kms \
			--delete \
			--dryrun 			
	done

	echo "Finished at $(date)"
	#  2 blank lines before next log entry
	echo ""
	echo ""
	
} > $log_path 2>&1

less $log_path

$SHELL	
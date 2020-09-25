#!/bin/bash

# Whole directories to back up
BACKUP_ORIGINS=("/c/Users/tloeb/desktop" \
  "/c/Users/tloeb/Standard Notes Backups" \
  "/c/Users/tloeb/AppData/Roaming/Mozilla/Firefox/Profiles/r8wk84di.default-release/bookmarkbackups" \
  "/f")
# Keep name of S3 bucket out of version control (just in case)
DESTINATION_BUCKET_PATH=$(cat /f/projects/utilities/backup/config/backup_destination.txt)
AWS_PROFILE=b
LOG_PATH="/c/logs/backups/s3_backup_sync.log"

{
	# Directories
	# -----------

	# echo "$(date) - ${BASH_SOURCE[0]}" 	# Linux only
	echo $(date)
	# Double quotes around array ensure we can have spaces in paths (if
	# we also put double quotes around each path in array.)
	for dir in "${BACKUP_ORIGINS[@]}"; do
		# Add path of original file to S3, but truncate first character ('/').
		# Using AWS managed KMS key, so we don't have to provide a key ID.
		aws s3 sync "$dir" "s3://${DESTINATION_BUCKET_PATH}/${dir:1}" \
			--storage-class=STANDARD_IA \
			--profile=$AWS_PROFILE \
			--exclude "*\$RECYCLE.BIN*" \
			--exclude "*.git*" \
			--exclude "*.Rproj*" \
			--exclude "*.joblib.*" \
			--exclude "*.ipynb_checkpoints*" \
			--exclude "*IDriveLocal*" \
			--sse aws:kms \
			--delete \
			--dryrun 
			
	done

	# New line before next log entry
	echo ""
	
} > $LOG_PATH 2>&1

$SHELL	
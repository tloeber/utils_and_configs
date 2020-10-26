#!/bin/bash

# Whole directories to back up
backup_origins=("/c/Users/tloeb/desktop" \
  "/c/Users/tloeb/AppData/Roaming/Mozilla/Firefox/Profiles/r8wk84di.default-release/bookmarkbackups" \
  "/f")
backup_origins_deep_archives=("/r")

# Individual files to backup
backup_files=("/c/Users/tloeb/AppData/Local/Google/Chrome/User Data/Default/Bookmarks")

aws_profile="b"
log_path="/c/logs/backups/s3_backup_sync.log"
# Keep name of S3 bucket out of version control (just in case)
destination_bucket_path=$(cat /f/projects/utils_and_configs/backup/config/backup_destination.txt)

{
	# Directories
	# -----------

	# echo "$(date) - ${BASH_SOURCE[0]}" 	# Linux only
	echo "Started at $(date)"
	echo "Backing up whole directories to Standard IA:"
	for dir in "${backup_origins[@]}"; do
		# It's not possible to specify KMS encryption for Glacier. It's automatically encrypted using AES-256.
		aws s3 sync "$dir" "s3://${destination_bucket_path}${dir}" \
			--storage-class=STANDARD_IA \
			--profile=$aws_profile \
			--exclude "*$RECYCLE.BIN*" \
			--exclude "*.git*" \
			--exclude "*.Rproj*" \
			--exclude "*.joblib.*" \
			--exclude "*.ipynb_checkpoints*" \
			--exclude "*IDriveLocal*" \
			--sse aws:kms \
			--delete \
			# --dryrun 			
	done

	# New line 
	echo ""


    # Directories to Glacier DA
	# -------------------------

	echo "Backing up whole directories to Glacier Deep Archive:"
	for dir in "${backup_origins_deep_archives[@]}"; do
		# Add directory of original file to S3 as prefix.
		# Using AWS managed KMS key, so we don't have to provide a key ID.
		aws s3 sync "$dir" "s3://${destination_bucket_path}${dir}" \
			--storage-class=DEEP_ARCHIVE \
			--profile=$aws_profile \
			--exclude "*$RECYCLE.BIN*" \
			--delete 
			# --dryrun 			
	done

	# New line 
	echo ""


	# Individual files
	# ----------------

	echo "Backing up individual files to Standard IA:"
	for path in "${backup_files[@]}"; do
		# Get directory name from path, and exclude all other files
		dir=$(dirname "$path")
		aws s3 sync "$dir" "s3://${destination_bucket_path}${path}" \
			--storage-class=STANDARD_IA \
			--profile=$aws_profile \
			--exclude "*" \
			--include "$path" \
			--sse aws:kms \
			--delete \
			# --dryrun 		
	done

	echo "Finished at $(date)"
	#  2 new lines before next log entry
	echo ""
	echo ""
	
} > $log_path 2>&1

# Open log file with VS Code
code $log_path

$SHELL	
#!/bin/bash

# Whole directories to back up
BACKUP_ORIGINS=("/c/Users/tloeb/desktop" \
  "/c/Users/tloeb/Standard Notes Backups" \
  "/c/Users/tloeb/AppData/Roaming/Mozilla/Firefox/Profiles/r8wk84di.default-release/bookmarkbackups" \
  "/f")
BACKUP_ORIGINS_DEEP_ARCHIVE=("/r")

# Individual files to backup
BACKUP_FILES=("/c/Users/tloeb/AppData/Local/Google/Chrome/User Data/Default/Bookmarks")

# Keep name of S3 bucket out of version control (just in case)
DESTINATION_BUCKET_PATH=$(cat /f/projects/utils_and_configs/backup/config/backup_destination.txt)
AWS_PROFILE="b"
LOG_PATH="/c/logs/backups/s3_backup_sync.log"

{
	# Directories
	# -----------

	# echo "$(date) - ${BASH_SOURCE[0]}" 	# Linux only
	echo "Started at $(date)"
	echo "Backing up whole directories to Standard IA:"
	for dir in "${BACKUP_ORIGINS[@]}"; do
		# It's not possible to specify KMS encryption for Glacier. It's Automatically encrypted using AES-256.
		aws s3 sync "$dir" "s3://${DESTINATION_BUCKET_PATH}${dir}" \
			--storage-class=STANDARD_IA \
			--profile=$AWS_PROFILE \
			--exclude "*\$RECYCLE.BIN*" \
			--exclude "*.git*" \
			--exclude "*.Rproj*" \
			--exclude "*.joblib.*" \
			--exclude "*.ipynb_checkpoints*" \
			--exclude "*IDriveLocal*" \
			--delete \
			# --dryrun 
			
	done

	# New line 
	echo ""


    # Directories to Glacier DA
	# -------------------------

	echo "Backing up whole directories to Glacier Deep Archive:"
	for dir in "${BACKUP_ORIGINS_DEEP_ARCHIVE[@]}"; do
		# Add directory of original file to S3 as prefix.
		# Using AWS managed KMS key, so we don't have to provide a key ID.
		aws s3 sync "$dir" "s3://${DESTINATION_BUCKET_PATH}${dir}" \
			--storage-class=DEEP_ARCHIVE \
			--profile=$AWS_PROFILE \
			--exclude "*$RECYCLE.BIN*" \
			# --exclude "*Pictures/*.jpg" \
			# --exclude "*Pictures/*.JPG" \
			# --exclude "*Pictures/*.PNG" \
			# --exclude "*Pictures/*.ini" \
			# --exclude "*Pictures/*.exe" \
			--sse aws:kms \
			--delete 
			# --dryrun 
			
	done

	# New line 
	echo ""


	# Individual files
	# ----------------

	echo "Backing up individual files to Standard IA:"
	for path in "${BACKUP_FILES[@]}"; do
		# Get directory name from path, and exclude all other files
		dir=$(dirname "$path")
		aws s3 sync "$dir" "s3://${DESTINATION_BUCKET_PATH}${path}" \
			--storage-class=STANDARD_IA \
			--profile=$AWS_PROFILE \
			--exclude "*" \
			--include "$path" \
			--sse aws:kms \
			--delete \
			# --dryrun 
			
	done

	echo "Finished at $(date)"
	# New line before next log entry
	echo ""
	
} > $LOG_PATH 2>&1

# Open log file with VS Code
code $LOG_PATH

$SHELL	
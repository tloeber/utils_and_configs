#!/bin/bash
set -eu

# *Disable* AWS CLI auto-promp (See https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-envvars.html#envvars-list-aws_cli_auto_prompt)
AWS_CLI_AUTO_PROMPT="on-partial"

# Whole *directories* to back up
backup_origins=("/mnt/c/Users/tloeb/desktop" "/mnt/f/") #   "/mnt/c/Users/tloeb/AppData/Roaming/Mozilla/Firefox/Profiles/r8wk84di.default-release/bookmarkbackups"
backup_origins_for_deep_archive=("/mnt/r/" "/mnt/v")
# Individual *files* to backup
backup_files=("/mnt/c/Users/tloeb/AppData/Local/Google/Chrome/User Data/Default/Bookmarks")

aws_profile="b"
log_path="/mnt/c/logs/backups/s3_backup_sync.log"
# Keep name of S3 bucket out of version control (just in case)
destination_bucket_path=$(cat ${HOME}/projects/utils_and_configs/backup/config/backup_destination.txt)

{
	# Directories
	# -----------

	echo ""
	echo "========================================="
	echo ""
	echo "Started at $(date)"

	echo "Backing up whole directories to Standard IA:"
	for dir in "${backup_origins[@]}"; do
		# Add parent directory of original file to S3 as prefix.
		# Using AWS managed KMS key, so we don't have to provide a key ID.
		aws s3 sync "$dir" "s3://${destination_bucket_path}${dir}" \
			--storage-class=STANDARD_IA \
			--profile=$aws_profile \
			--exclude "*\$RECYCLE.BIN*" \
			--exclude "*.git*" \
			--exclude "*.Rproj*" \
			--exclude "*.joblib.*" \
			--exclude "*.ipynb_checkpoints*" \
			--exclude "*IDriveLocal*" \
			--sse aws:kms \
			--delete \
			# --dryrun
	done


    # Directories to Glacier DA
	# -------------------------

	echo "Backing up whole directories to Glacier Deep Archive:"
	for dir in "${backup_origins_for_deep_archive[@]}"; do
		# It's not possible to specify KMS encryption for Glacier. It's automatically encrypted using AES-256.
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

$SHELL

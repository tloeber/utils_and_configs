# Windows backup
This script backs up *Windows drives*, but is *run from WSL* so that we can use familiar Linux tools.

## Requirements:
- AWS CLI
- WSL

## Usage:
- Put the name of the S3 bucket that will store the backup infile at ${HOME}/projects/utils_and_configs/backup/config/backup_destination.txt
- Run from WSL: `bash s3_backup_sync.sh`

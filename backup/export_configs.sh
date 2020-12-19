temp_local_backups_path="/var/tmp/ubuntu_other"

## Generate temporary local backups
 	#echo "Generating temporary local backups"
	# Installed packages
	dpkg --get-selections > "${temp_local_backups_path}/packages.bak"
	# Snap packages
	snap list > "${temp_local_backups_path}/packages.bak"
	# Partition table
	fdisk -l > "${temp_local_backups_path}/fdisk.bak"
	# MBR
	dd if=/dev/sda of=${temp_local_backups_path}/MBR.bak bs=512 count=1


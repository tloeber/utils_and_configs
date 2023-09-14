# Note: Instead of running the script, you can also open up the newly installed distro, which will
# prompt for user and password creation, and then set this user as a default.

set -eu

# By default there will only be root user, so create new user after installing distro.
USERNAME="thomas"

useradd $USERNAME
passwd $USERNAME
usermod -aG sudo $USERNAME

# Set this user as default.
# Note: Restart WSL for this to take effect.
echo -e "[user]\ndefault=$USERNAME" >> /etc/wsl.conf

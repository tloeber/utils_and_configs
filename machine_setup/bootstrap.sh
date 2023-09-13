# This script makes
# Prerequisites:
#  - ssh key for github (if non-default name, needs to be added to ssh agent. Add this to dotfiles)

set -eux

sudo apt update
sudo apt upgrade -y
sudo apt install -y git make

# Clone setup repo, if it does not already exist
if [ ! -d "$HOME/.local/repos/utils_and_configs" ] ; then
    mkdir ~/repos || echo "~/repos/ already exists."
    cd repos
    git clone https://github.com/tloeber/utils_and_configs.git
fi

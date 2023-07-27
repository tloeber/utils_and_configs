# This script makes
# Prerequisites:
#  - ssh key for github (if non-default name, needs to be added to ssh agent. Add this to dotfiles)

set -eux

sudo apt update
sudo apt upgrade -y
sudo apt install -y git make

# No error if directory already exists
mkdir -p repos
cd repos
git clone git@github.com:tloeber/utils_and_configs.git

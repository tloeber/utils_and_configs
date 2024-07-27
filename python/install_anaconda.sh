INSTALLER_VERSION=2023.03-0

curl -O https://repo.anaconda.com/archive/Anaconda3-<INSTALLER_VERSION>-Linux-x86_64.sh
bash Anaconda3-${INSTALLER_VERSION}-Linux-x86_64.sh

conda config --set auto_activate_base false

eval "$(/home/thomas-22/anaconda3/bin/conda shell.bash hook)"

echo $(date) >> C:\logs\chocolatey\chocolatey.log 2>&1
choco upgrade all -y >> C:\logs\chocolatey\chocolatey.log 2>&1

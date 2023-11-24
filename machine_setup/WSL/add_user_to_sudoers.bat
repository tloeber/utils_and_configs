@REM Addresses recurring "user not in sudoers" error.

wsl --distribution Ubuntu-22.04 --user root ^

# Below will be executed in WSL
usermod -aG sudo thomas-22
wsl --shutdown
pause
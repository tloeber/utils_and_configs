@echo off

@REM Addresses recurring "user not in sudoers" error.
@REM Usage: add_user_to_sudoers.bat ubuntu_distro user_name

wsl --distribution %1 --user root ^

usermod -aG sudo %2 && echo success

@REM Restart WSL (have to close VSCode first)
taskkill /IM Code.exe
echo It is expected that this cannot terminate all VSCode processes because we are not using /F
wsl --shutdown
@REM Start VSCode window again. (Opens last window.)
code

pause
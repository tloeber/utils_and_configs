@echo off

@REM Addresses recurring "user not in sudoers" error.
@REM Usage: add_user_to_sudoers.bat ubuntu_distro user_name


@REM Note the trailing line continuation character ("^"). This makes sure the next line is executed in the WSL shell.
@REM The usual way is to specify the WSL command using the --exec argument, but for some reason this was not working.
wsl --distribution %1 --user root ^

usermod -aG sudo %2 && echo success


@REM Restart WSL (have to close VSCode first)
@REM Note: While it would preferable to not duplicate the restart functionality, and instead call the dedicated
@REM batchscript in this folder, this would require hard-coding the folder location or putting script in the PATH.
taskkill /IM Code.exe
echo It is expected that this cannot terminate all VSCode processes because we are not using /F

@REM Note that WSL starts up again automatically
wsl --shutdown

@REM Start VSCode window again. (Opens last window.)
timeout /t 5
code

pause
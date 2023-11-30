@REM Restart WSL (have to close VSCode first)
taskkill /IM Code.exe
echo It is expected that this cannot terminate all VSCode processes because we are not using /F

@REM Note that WSL starts up again automatically
wsl --shutdown

@REM Start VSCode window again. (Opens last window.)
timeout /t 5
code

@REM Close VSCode and Docker Desktop first
taskkill /F /IM "Docker Desktop"
taskkill  /F /IM Code.exe

@REM Note that WSL starts up again automatically
wsl --shutdown

@REM Start Docker Desktop
timeout /t 5
start "Docker Desktop"

@REM Start VSCode window again. Opens last window(s).
timeout /t 5
code

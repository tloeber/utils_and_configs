%REM Trigger this to run on workstation unlock (in Windows Task Scheduler)
%REM Make sure to target the right WSL distro (Run `wsl --list` first)
%REM Should *not* require WSL restart

wsl --distribution Ubuntu-22.04 ^
    --user root ^
    --exec sudo hwclock -s

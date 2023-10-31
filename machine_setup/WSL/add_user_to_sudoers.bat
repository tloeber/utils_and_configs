@REM Addresses recurring "user not in sudoers" error.

wsl --distribution Ubuntu-22.04 ^
    --user root ^
    --exec usermod -aG sudo thomas-22

@REM Restart WSL to apply changes.
wsl --shutdown

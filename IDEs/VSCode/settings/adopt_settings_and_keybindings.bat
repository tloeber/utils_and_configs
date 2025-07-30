REM del  "%APPDATA%\Code\User\settings.json"
mklink /h "%APPDATA%\Code\User\settings.json" settings\settings.json

REM del "%APPDATA%\Code\User\keybindings.json"
mklink /h "%APPDATA%\Code\User\keybindings.json" keybindings\keybindings.json

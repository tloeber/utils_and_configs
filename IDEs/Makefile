# Export works both in PowerShell and Bash (incl. WSL)
export-extensions:
	code --list-extensions > extensions/extensions.txt

import-extensions-unix:
	cat extensions/extensions.txt | xargs -L 1 code --install-extension

import-extensions-windows:
	cat extensions/extensions.txt |% { code --install-extension $_}

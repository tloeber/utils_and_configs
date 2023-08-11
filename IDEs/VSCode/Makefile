export-extensions:
	code --list-extensions \
		| xargs -L 1 echo code --install-extension \
		> extensions/install_extensions.sh

import-extensions:
	bash extensions/install_extensions.sh

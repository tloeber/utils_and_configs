export-extensions:
	code --list-extensions \
		| xargs -L 1 echo code --install-extension \
		> extensions/extensions.sh

import-extensions:
	bash extensions/extensions.sh

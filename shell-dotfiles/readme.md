<https://www.gnu.org/software/bash/manual/html_node/Bash-Startup-Files.html>

# interactive

## login shell

- First: /etc/profile (if that file exists)
- Looks for ~/.bash_profile, ~/.bash_login, and ~/.profile, in that order, and sources first one that exists and is readable.
- **Typically ~/.bash_profile manually sources .bashrc,**
- Custom behavior:
  - can also enable this for non-interactive shell with the --login option,
  - disable by passing --noprofile option.

## non-login shell (e.g., VSCode terminal)

- ~/.bashrc, if that file exists.
- Custom behavior:
  - Disable by passing `--norc` option.
  - The `--rcfile` option will force Bash to source custom file.

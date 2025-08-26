# ==============================================================================
# This file is loaded for *login* bash shells.
#
# Put **profile setup** in this file, such as setting path or environment variables.
# Note that these changes will not apply to sh; but since there are only few
# use cases for sh, I decided that it is safer to put general setup code in a
# file read only by bash. This avoids having to worry about whether the code is
# compatible with non-bash shells.
# ==============================================================================


# Source .bashrc
# ==============

# Otherwise, bashrc is only read by *non*-login shell
if [ -f "$HOME/.bashrc" ]; then
. "$HOME/.bashrc"
fi


# Path
# ====

# set PATH so it includes user's private bin
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# Windows-specific
# ----------------
# make
if [ -d "/c/Program Files (x86)/GnuWin32/bin" ]; then
    PATH="$PATH:/c/Program Files (x86)/GnuWin32/bin"
fi


# Configuration
# =============

# ASDF
# ----
# Run *after* setting PATH
. "$HOME/.local/bin/asdf/asdf.sh"
# Code completion
. "$HOME/.local/bin/asdf/completions/asdf.bash"

# Autoenv
# -------
source ~/.autoenv/activate.sh


# Set environment variables
# =========================

# tfenv
TFENV_ARCH=amd_64

# Dev setup
# ---------
export ENVIRONMENT="local"
export LOGURU_LEVEL="INFO"

# AWS
# ---
# https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-envvars.html
export AWS_CLI_AUTO_PROMPT=off  # Need to override this if running aws cli commands in a script
export AWS_PROFILE=default  # Set default profile
# export AWS_RETRY_MODE=standard

# Secrets
# -------
if [ -f "$HOME/.secrets" ]; then
    # Automatically export all variables defined.
    set -a

    # Source env file with secrets
    . "$HOME/.secrets"
    echo "Sourced ~/.secrets"

    # Turn off automatic export again
    set +a
fi


# Log
# ===
echo "Sourced .bash_profile"

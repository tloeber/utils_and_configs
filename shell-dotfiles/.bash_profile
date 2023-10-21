# ==============================================================================
# This file is loaded for both login and non-login bash shells.
#
# Put **profile setup** in this file, such as setting path or environment variables.
# Note that these changes will not apply to sh; but since there are only few
# use cases for sh, I decided that it is safer to put general setup code in a
# file read only by bash. This avoids having to worry about whether the code is
# compatible with non-bash shells.
# ==============================================================================

# Make sure .bashrc is also read by a LOGIN shell.
if [ -f "$HOME/.bashrc" ]; then
. "$HOME/.bashrc"
fi


# Environment variables
# ---------------------

# This file will *not* be sourced by IDEs to avoid polluting local dev env with any user settings.
if [ -f ~/.env_login_shell ]; then
    . ~/.env_login_shell
fi


# Log
# ---
echo "Sourced .bash_profile"

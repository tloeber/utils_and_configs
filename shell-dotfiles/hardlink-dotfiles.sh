
# Backup existing dotfiles
mv ~/.profile ~/.profile.bak
mv ~/.bash_profile ~/.bash_profile.bak
mv ~/.bashrc ~/.bashrc.bak
mv ~/.bash_aliases ~/.bash_aliases.bak || echo "No existing bash_aliases found, skipping backup"

# Hard-link dotfiles from repo
ln .profile ~/.profile
ln .bash_profile ~/.bash_profile
ln .bashrc ~/.bashrc
ln .bash_aliases ~/.bash_aliases

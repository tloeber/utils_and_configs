# Start SSH agent and add key with non-default name
eval $(ssh-agent -s)
ssh-add ~/.ssh/id_rsa

# Change to directory where repositories are stored
cd /f/projects/

# Keep window open
$SHELL

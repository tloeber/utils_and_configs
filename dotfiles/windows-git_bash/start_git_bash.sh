# Start SSH agent and add key with non-default name
eval $(ssh-agent -s)
ssh-add ~/.ssh/id-github

# Change to directory where repositories are stored
cd /f/projects/utils_and_configs

# Keep window open
$SHELL

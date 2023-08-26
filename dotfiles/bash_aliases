## Docker
## =======

# Container ("_" added since "docker-compose" is more important command)
alias dc_="docker container"
alias dc_ls="docker container ls"
alias dc_rm="docker container rm"
alias dc_r="docker container run"
alias dc_s="docker container start"
alias dc_a="docker container attach"
alias dc_e="docker container exec"

# Network
alias dn="docker network"

# Image
alias di="docker image"
alias dib="docker image build"

# Volume
alias dv="docker volume"

# Compose
alias dc="docker compose"
alias dcu="docker compose up"
alias dcr="docker compose restart"
alias dcd="docker compose down"


# dcr()
# Usage: dls '-it alpine sh'
#{	docker container run $1}

# Other
alias dl="pass dockerhub_token | docker login -u loebert --password-stdin"


## tmux
## ====

alias tls="tmux ls"
alias tn="tmux new -s"
alias ta="tmux attach -t"


## Git
## ===

alias gs="git status"
alias gc="git commit"
alias gcm="git commit -m"
alias gl="git log"
alias glo="git log --oneline"
alias glg="git log --graph --oneline --decorate --all"
alias gd="git diff"
alias ga="git add"
alias gb="git branch"
alias gr="git remote"
alias gpush="git push"
alias gpull="git pull"
alias gm="git move"
# Add *one or more* file and commit
function gac {
  git add "$@" && git commit
}


## other
## =====

alias h="history | tail"

# Create directory and change into it
function mc {
   mkdir $1 && cd $1
}

alias tf="terraform"


## Custom functions
## ================

function validate_json {
   (python3 -mjson.tool "$1" > /dev/null  && echo "json is valid.") || \
   echo "json is NOT valid."
}

function validate_json2 {
   cat $1 | jq empty
}

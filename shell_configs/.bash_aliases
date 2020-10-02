## Docker
## =======

# Container
alias dc="docker container"
#alias dcls="docker container ls"
#alias dcrm="docker container rm"
alias dcr="docker container run"
alias dcs="docker container start"
alias dca="docker container attach"
alias dce="docker container exec"

# Network
alias dn="docker network"

# Image
alias di="docker image"
alias dib="docker image build"

#Volume 
alias dv="docker volume"

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


## other
## =====

alias h="history | tail"

# Create directory and change into it
function mc {
   mkdir $1 && cd $1
}


## Custom functions
## ================

function validate_json {
   python -mjson.tool "$1" > /dev/null
}

function validate_json2 {
   cat $1 | jq empty
}

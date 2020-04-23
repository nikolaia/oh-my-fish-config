alias git="hub"
alias clip="pbcopy"
alias ll="ls -la"
alias cat="bat"

# Aliases for docker
alias d="docker"
alias dcomp="docker-compose"
alias dmac="docker-machine"
alias drma="docker rm -f (docker ps -a -q)"

alias tf="terraform"

### LOCALHOST PLUGIN

# Opens http://localhost:3000 (and other ports) in the default browser
#
# Usage:
#
# open a commonly used port with just the port number
# $ 3000
#
# open an arbitrary port using the `lh` command
# $ lh 3001

## Functions
function eb-describe
    if [ (count $argv) -lt 1 ]
        echo "You need to specify a application name"
        return 1
    end
    aws elasticbeanstalk describe-environments --application-name $argv --environment-name $argv-prod --query 'Environments[*].{Status: Status,Health: Health,HealthStatus: HealthStatus}' --output json | jq
end

function tail-cmd
    while true
        clear
        $argv
        sleep 5
    end
end
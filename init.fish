set PATH /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/ $PATH
set PATH $HOME/.rvm/bin $PATH
set PATH /Applications/Postgres.app/Contents/Versions/9.3/bin $PATH
set PATH /Users/nikolaia/.cargo/bin $PATH
set -gx GOPATH $HOME/Development/Go
set -gx RUST_SRC_PATH $HOME/Development/rust/src/
set -gx JAVA_HOME `/usr/libexec/java_home -v 1.7`
set -gx ANDROID_HOME /usr/local/opt/android-sdk
# set -g HOMEBREW_GITHUB_API_TOKEN REPLACE_ME_WITH_TOKEN

# Function for running Maude with arguments
function maude
    fish -c "~/.maude/maude.darwin64 $argv"
end

function code
    set -gx VSCODE_CWD (pwd)
    command open -n -b "com.microsoft.VSCode" $argv
end

alias l="ls -la"

# Aliases for docker
alias d="docker"
alias dcomp="docker-compose"
alias dmac="docker-machine"

# Pass arguments to paket.exe in .paket folder
function paket
  fish -c "mono (pwd)/.paket/paket.exe $argv"
end

# Call build.sh in current dir
function fake
  fish -c "bash -c 'sh build.sh $argv'"
end

# New fsharp project
function projectscaffold
  fish -c "git clone git@github.com:fsprojects/ProjectScaffold.git $argv"
  fish -c "bash -c 'sh $argv/build.sh'"
end

###-begin-yo-completion-###
# Requires npm install -g yo
function _yo_completion
  set cmd (commandline -opc)
  set cursor (commandline -C)
  set completions (eval env DEBUG=\"" \"" COMP_CWORD=\""$cmd\"" COMP_LINE=\""$cmd\"" COMP_POINT=\""$cursor\"" yo-complete completion --json)

  for completion in $completions
    set cmd "node -e \"var parts = '$completion'.split(':'); console.log(parts.slice(0, -1).join(':')); console.log(parts.slice(-1)[0]);\""
    set parts (eval $cmd)
    complete -f -c yo -a "'$parts[1]'" -d "$parts[2]"
    echo $parts[1]
  end
end

complete -d 'yo' -c yo -a "(eval _yo_completion)"
###-end-yo-completion-###

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
function _open-installed
  which open >/dev/null ^&1
end

## Main program
function lh
  if _open-installed
    if [ (count $argv) -lt 1 ]
        echo "You need to specify a port to open"
        return 1
    end
    command open http://localhost:$argv
  else
    echo 'Requires open (MacOS only) to be installed'
  end
end

set -l common_localhost_ports 3000 4000 5000 6000 7000 8000 8001 9000 8080

for port in $common_localhost_ports
  eval "function $port; lh $port; end"
end

### END LOCALHOST PLUGIN

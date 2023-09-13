source $HOME/.bash_path

# hide zsh info: https://support.apple.com/en-gb/HT208050
export BASH_SILENCE_DEPRECATION_WARNING=1

export HOMEBREW_GITHUB_API_TOKEN="GITHUB_API_TOKEN"

[[ -f ~/.bashrc ]] && source ~/.bashrc
[[ -f ~/.bash_aliases ]] && source ~/.bash_aliases
[[ -f ~/.bash_prompt ]] && source ~/.bash_prompt

# hook up any bash completion tooling
source ~/bash_completion
# source <(cat ~/.bash_completion.d/*)


# colours for grep
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;32'

# -----------------------
# virtualenvwrapper Stuff
## To tell pip to only run if there is a virtualenv currently activated and to bail if not
export PIP_REQUIRE_VIRTUALENV=true                                 

VIRTUALENVWRAPPER="/usr/local/bin/virtualenvwrapper.sh"
if [ -n "$VIRTUALENVWRAPPER" ];then
  if [ ! -d "$HOME/.virtualenvs" ];then mkdir "$HOME/.virtualenvs";fi
  export WORKON_HOME="$HOME/.virtualenvs"
  export PIP_VIRTUALENV_BASE="$WORKON_HOME"
  export PIP_RESPECT_VIRTUALENV=true # use currently activated virtualenv
  source "$VIRTUALENVWRAPPER"
fi

#SMSGATES_BOOTSTRAP=`which smsgates_bootstrap.sh`
#if [ "$?" -eq "0" ]; then
#  export SMSGATES_SENDSMS_GATE="GATENAME"
#  export SMSGATES_SENDSMS_LOGIN="LOGIN"
#  export SMSGATES_SENDSMS_PASSWORD="PASSWORD"
#  source "$SMSGATES_BOOTSTRAP"
#fi

# disable hub - see `gh` https://cli.github.com
#HUB=`which hub`
#if [ "$?" -eq "0" ]; then
#  export GITHUB_USER="USER"
#  export GITHUB_PASSWORD="PASS"
#fi


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/lukmdo/Downloads/google-cloud-sdk/path.bash.inc' ]; then source '/Users/lukmdo/Downloads/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/lukmdo/Downloads/google-cloud-sdk/completion.bash.inc' ]; then source '/Users/lukmdo/Downloads/google-cloud-sdk/completion.bash.inc'; fi

# AWS CLI
[[ -f /usr/local/bin/aws_completer ]] && complete -C '/usr/local/bin/aws_completer' aws 

if [ -f $HOME/.scripts/resty/resty ]; then
  source $HOME/.scripts/resty/resty
  ln -fs $HOME/.scripts/resty/pp $HOME/bin/
  ln -fs $HOME/.scripts/resty/pypp $HOME/bin/
fi

if [ -f $HOME/bin/skaffold ]; then 
    eval "$(skaffold completion bash)"
fi

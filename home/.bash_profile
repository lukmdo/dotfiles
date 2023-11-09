source $HOME/.bash_path

# hide zsh info: https://support.apple.com/en-gb/HT208050
export BASH_SILENCE_DEPRECATION_WARNING=1

#export HOMEBREW_GITHUB_API_TOKEN="GITHUB_API_TOKEN"

source ~/.bash_my_profile

source ~/.bashrc
source ~/.bash_aliases
source ~/.bash_prompt
source <(cat ~/.bash_functions.d/*.sh)  # note: source with *glob wont work
source ~/.bash_completion

# Colours for grep
# ===
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;32'

# VirtualEnvWrapper config
# ===
# Allow pip to run only with activated virtualenv.
export PIP_REQUIRE_VIRTUALENV=true

export VIRTUALENVWRAPPER_PYTHON=$(which python3)
VIRTUALENVWRAPPER=$(which virtualenvwrapper.sh)
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


## NOTE: gcloud auto added bellow
export CLOUDSDK_PYTHON=$(which python3)

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/lukmdo/env/google-cloud-sdk/path.bash.inc' ]; then . '/Users/lukmdo/env/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/lukmdo/env/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/lukmdo/env/google-cloud-sdk/completion.bash.inc'; fi

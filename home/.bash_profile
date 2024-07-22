source $HOME/.bash_path

# hide zsh info: https://support.apple.com/en-gb/HT208050
export BASH_SILENCE_DEPRECATION_WARNING=1

#export HOMEBREW_GITHUB_API_TOKEN="GITHUB_API_TOKEN"

source ~/.bashrc
source ~/.bash_completion
source ~/.bash_aliases
source ~/.bash_prompt
source <(cat ~/.bash_functions.d/*.sh)  # note: source with *glob wont work

# source ~/.config/terraform

source ~/.bash_my_profile

# Colours for grep
# ===
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;32'

export JQ_COLORS="0;90:0;37:0;37:0;37:0;32:1;37:1;37:1;36"

# Less/Pager
# ===
export LESS="--ignore-case"
## colourize `man`. See:
#    man -P "cat" less | grep -A30 "color is either"
# Example: (+add colours)
#    -Dd+g : bold -> (+g)green
#    -Du+y : underline-> (+y)yellow
# export MANPAGER="less --ignore-case -R --use-color -Dd+G -Du+kw"
export MANPAGER="less --ignore-case -R --use-color -Dd+g -Du+c"


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

export HOMEBREW_REPOSITORY=$(brew --repository)

export GOOGLE_APPLICATION_CREDENTIALS="$HOME/.config/gcloud/application_default_credentials.json"
# export CLOUDSDK_PYTHON="/opt/homebrew/bin/python3.11"

## NOTE: gcloud auto added bellow
export CLOUDSDK_PYTHON=$(which python3)

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/lukasz.dobrzanski/env/google-cloud-sdk/path.bash.inc' ]; then . '/Users/lukasz.dobrzanski/env/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/lukasz.dobrzanski/env/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/lukasz.dobrzanski/env/google-cloud-sdk/completion.bash.inc'; fi

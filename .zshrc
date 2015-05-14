# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
autoload -U colors
colors
ZSH_THEME="robbyrussell"
#ZSH_THEME="random"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

#--------------------------------------------------------------------------#
#-------------Customize to your needs...-----------------------------------#
#--------------------------------------------------------------------------#

# Right promt, time
RPROMPT=$'%{\e[1;31m%}[%{\e[1;37m%}%*%{\e[1;31m%}]%{\e[0m%}'

# Aliases
alias ls='ls --classify --color --human-readable --group-directories-first'
alias l='ls --classify --color --human-readable --group-directories-first'
alias ll='ls -l --classify --color --human-readable --group-directories-first'

alias cp='nocorrect cp --interactive --verbose --recursive --preserve=all'
alias mv='nocorrect mv --verbose --interactive'
alias grep='grep --colour=auto'
alias rm='rm -v'
alias mv='mv -v'
alias k='killall' 
alias killall="killall --interactive --verbose"
alias free="free -t -m"
alias s='sudo'
alias -s py=python


export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
source ~/.rvm/scripts/rvm

export JAVA_HOME="/usr/lib/jvm/jdk1.8.0_40"
export PATH="$PATH:$JAVA_HOME/bin"

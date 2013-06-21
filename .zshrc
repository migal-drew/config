# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
autoload -U colors
colors
#ZSH_THEME="robbyrussell"
#ZSH_THEME="random"
ZSH_THEME="fino-time"

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
#eval "$(dircolors ~/.dir_colors)"

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
alias -s {odt,doc,sxw,rtf}=openoffice.org
autoload -U pick-web-browser
alias -s {html,htm}=chromium

# Распаковка архивов
# example: extract file
extract () {
 if [ -f $1 ] ; then
 case $1 in
 *.tar.bz2)   tar xjf $1        ;;
 *.tar.gz)    tar xzf $1     ;;
 *.bz2)       bunzip2 $1       ;;
 *.rar)       unrar x $1     ;;
 *.gz)        gunzip $1     ;;
 *.tar)       tar xf $1        ;;
 *.tbz2)      tar xjf $1      ;;
 *.tbz)       tar -xjvf $1    ;;
 *.tgz)       tar xzf $1       ;;
 *.zip)       unzip $1     ;;
 *.Z)         uncompress $1  ;;
 *.7z)        7z x $1    ;;
 *)           echo "I don't know how to extract '$1'..." ;;
 esac
 else
 echo "'$1' is not a valid file"
 fi
}

# Запаковать архив
# example: pk tar file
pk () {
 if [ $1 ] ; then
 case $1 in
 tbz)       tar cjvf $2.tar.bz2 $2      ;;
 tgz)       tar czvf $2.tar.gz  $2       ;;
 tar)      tar cpvf $2.tar  $2       ;;
 bz2)    bzip $2 ;;
 gz)        gzip -c -9 -n $2 > $2.gz ;;
 zip)       zip -r $2.zip $2   ;;
 7z)        7z a $2.7z $2    ;;
 *)         echo "'$1' cannot be packed via pk()" ;;
 esac
 else
 echo "'$1' is not a valid file"
 fi
}

export LD_PRELOAD="/home/andrey/utilities/stderred/build/libstderred.so"
export LD_LIBRARY_PATH=/opt/lib:/opt/opencv_2.4.4/lib   

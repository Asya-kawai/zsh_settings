# ### General settings
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '$HOME/.zshrc'
# No case sensitivity
zstyle ':conpletion:*' matcher-list 'm:{a-z}={A-Z}'
# sudo path setting.
#zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

# ### PATH settings
# PATH_XXX => XXX's path
# PATH => ENV

# ##### X11
# PATH_X11=/usr/X11R6/bin:/usr/X11R6/sbin

# ##### local
PATH_LOCAL=$HOME/bin:$HOME/sbin
PATH_DOT_LOCAL=$HOME/.local/bin

# #### JDK (original JDK installed, check jdk-version.)
# use update-alternatives for setup 
#JAVA_HOME=/usr/local/java/jdk1.8.0_91

# #### android SDK
PATH_ANDROID_SDK=$HOME/android-studio/bin

# #### arduino IDE
#PATH_ARDUINO_IDE=$HOME/Arduino-IDE/arduino-1.6.7

# #### rbenv
PATH_RBENV=$HOME/.rbenv/bin

# #### pyenv
PATH_PYENV=$HOME/.pyenv/bin

# #### leiningen --- clojure management tools ---
#LEININGEN_HOME=/$HOME/bin/leiningen

DEFAULT_PATH=/usr/local/bin:/usr/local/sbin:/bin:/sbin:/usr/bin:/usr/sbin
PATH=$PATH_ANDROID_SDK:$PATH_RBENV:$PATH_PYENV:$JAVA_HOME:$PATH_DOT_LOCAL:$PATH_LOCAL:$PATH_X11:$DEFAULT_PATH

export PATH

# ### MAN PATH setting
export MANPATH=$HOME/man:$MANPATH

# #### LIBRARY setting
LD_LIBRARY_PATH=$HOME/lib:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH

# ### RUBY LIBRARY settings
export RUBYLIB=".:./lib:${HOME}/local/lib/ruby:/usr/local/lib/ruby"

# ### language settings
# #### JMAN
# if setting LANG, LC_CTYPE dont need set.
LC_MESSAGES="en_US.UTF-8"

# #### LANG 
#export LANG=ja_JP.UTF-8
#export LANG="en_US.UTF-8"
#export LANG="ja_JP.eucJP"
export XMODIFIERS=@im=ibus
export GTK_IM_MODULE=ibus
export QT_IM_MODULE=ibus

# ### COMPLECATION CONF settings
# default complication setting
autoload -Uz compinit
compinit
setopt auto_param_keys
# get complication after "="
setopt magic_equal_subst

# auto reverse suggestion
bindkey "[Z" reverse-menu-complete

# ### DIRECTORY settings
# Auto change dir
setopt auto_cd
setopt mark_dirs

# ### COMMAND settings
# #### cd history
# Auto get dir list by cd -[tab]
setopt auto_pushd
# Ignore overlap
setopt pushd_ignore_dups

# #### LS(COMMAND)
setopt list_packed
setopt auto_list
setopt noautoremoveslash
setopt nolistbeep

# #### Print japanese
setopt print_eight_bit

# ### KEYBIND setting
#Emacs style keybind
bindkey -e

# ### PROMPT setting
# %M => fullhostname        %m => hostname
# %n => username            %y => cosolename
# %# => root:# else:%
# %? => result command code
# %/ => currentdir          %~ => currenctdir
# %S => start reverse       %s => end reverse
# %B => start bold          %b => end bold
# %U => start underbar      %u => end underbar
#
# ^[ is escape character 
# emacs: Ctrl-q ESC
# vi   : Ctrl-v ESC
#
# Use escape sequence in prompt
# escape character : \e
# $'' is can be written in \e
# color is set at \e[(color-number)m
# %{ ... %} is used when prompt color change
# ex) PROMPT=$'%{\e[36m%}%n'
setopt prompt_subst

# Prompt color ON
autoload -U colors
colors

# Command correct
setopt correct

case ${UID} in
    0)
        PROMPT="%{[31m%}%Broot%{[m%}%{[33m%}%B@%{[m%}%{[32m%}%B%m%{[m%}%{[33m%}%B%#%b%{[m%} "
        SPROMPT="%{[34m%}%Bcorrect: %R --> %r [No/Yes/Abort/Edit]?%b%{[m%}"
        RPROMPT="%{[32m%}%B[%~]%b%{[m%}"
        ;;
    *)
        PROMPT="%{[36m%}%B$USER%{[m%}%{[33m%}%B@%{[m%}%{[32m%}%B%m%{[m%}%{[33m%}%B%#%b%{[m%} "
        SPROMPT="%{[34m%}%Bcorrect: %R --> %r [No/Yes/Abort/Edit]?%b%{[m%} "
        RPROMPT="%{[32m%}%B[%~]%b%{[m%}"
        ;;
esac

# ### HISTORY settings
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "" history-beginning-search-backward-end
bindkey "" history-beginning-search-forward-end

# #### Command history conf
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
setopt extended_history

setopt append_history
setopt inc_append_history

# #### No add same hist list
setopt hist_ignore_dups
setopt hist_ignore_all_dups

# #### Share hist date
setopt share_history

# #### No add hist command
setopt hist_no_store
# Delete rest blanks
setopt hist_reduce_blanks

# ### ALIAS settings
# Alias is needs if /file/dir conpletion work
setopt complete_aliases
alias j="jobs -l"
alias h="history"
#alias ls="ls --color -F"
alias ls="ls -F"
alias la="ls -aF"
alias lf="ls -FA"
alias ll="ls -lAF"
alias em="emacs -nw"
alias ems="emacs --daemon"
alias emc="emacsclient"
alias df="df -Th"
alias du="du -h"
alias beep="echo -e '\a'"
# Show previous command
alias p="fc -ln -1"

# It's noisy...
#alias beep="echo -en \"\\007\""

# ### BEEP setting
setopt no_beep

# ### NO EXIT BY Ctrl-d
setopt ignore_eof

# ### NO CORE FILE
limit coredumpsize 0

# ### GLOB settings
setopt glob
setopt extendedglob
setopt glob_dots
setopt case_glob
setopt extended_glob

# ### NOTICE JOBS
setopt notify

# ### LS_COLORS settings
# 00 : nomal
# 01 : bold
# 04 : underline
# 05 : flush
# 07 : reverse-{for,back}-ground-color
# 08 : no display
# 22 : nomalize
# 24 : no unerline
# 25 : no flush
# 27 : no reverse-{for,back}-gorund-color
# ### COLORS NUMBER
# COLORS  :: forgournd-color, background-color
# black   :: 30, 40
# red     :: 31, 41
# green   :: 32, 42
# yellow  :: 33, 43
# blue    :: 34, 44
# purple  :: 35, 45
# cyan    :: 36, 46
# gray    :: 37, 47
# default :: 39, 49
# ### FILES
# no : normal text file
# fi : normal file
# di : directory
# ln : symbolic link
# or : no linked symbolic
# so : socket
# pi : pipe
# ex : execution
# bd : block special
# cd : character special
# su : execute file with setuid
# sg : execute file with setgid
# tw : other writeable directory with sticky bit
# ow : other writeable directory without sticky bit

# ### TERM settings
if [ "$TERM" = "xterm" ]; then
    export TERM="xterm-color"
elif [ "$TERM" = "kterm" ]; then
    export TERM="kterm-color"
fi
case "${TERM}" in
    ### case is FreeBSD8.X
    *term* | tmux* | screen*)
        unset LSCOLORS
        # For BSD ls
        export LSCOLORS=exfxcxdxbxegedabagacad
        # For GUI ls
        export LS_COLORS='di=01;34:ln=01;35:so=01;32:pi=33:ex=01;31:bd=43;31:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
        zstyle ':completion:*' list-colors 'di=01;34' 'ln=01;35' 'so=01;32' 'ex=01;31' 'bd=43;31' 'cd=43;34'
        ;;
    ### case is FreeBSD8.X
    cons25 | linux)
        #unset LANG
        export LSCOLORS=ExFxCxdxBxegedabagacad
        export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:sg=46;30:tw=42;30:ow=43;30'
        zstyle ':completion:*' list-colors 'di=34;1' 'ln=35;1' 'so=32;1' 'ex=31;1' 'bd=46;34' 'cd=43;34'
        ;;
esac

# ### Load PLUGINS
# common alias command
# #### ZSH plugins
if [ ! -d ~/.zplug -o ! -e ~/.zplug/init.zsh ]; then
    # reference: https://github.com/zplug/zplug
    curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
fi
source ~/.zplug/init.zsh

# syntax-highlighting
# (If the defer tag is given 2 or above, run after compinit command)
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets cursor)
# #### main
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=yellow,bold'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=yellow,underline,bold'
ZSH_HIGHLIGHT_STYLES[command]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=green,underline,bold'
ZSH_HIGHLIGHT_STYLES[globbing]='fg=blue,bold'
ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=blue,bold'
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter]='fg=magenta,bold'
ZSH_HIGHLIGHT_STYLES[process-substitution-delimiter]='fg=magenta,bold'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument-delimiter]='fg=magenta,bold'
# #### cursor
ZSH_HIGHLIGHT_STYLES[cursor]='bold'
zplug "zsh-users/zsh-syntax-highlighting", defer:2

# zsh-substring-search
zplug "zsh-users/zsh-history-substring-search"
bindkey -M emacs "" history-substring-search-up
bindkey -M emacs "" history-substring-search-down

# auto-suggestions
# It's too heavy...
#zplug "zsh-users/zsh-autosuggestions"
#zplug "zsh-users/zsh-completions"
#zplug "chrissicool/zsh-256color"

# #### zplug load
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi
zplug load

# ### Programming Language settings
# #### opam init's code
export OPAMBUILDDOC=1
. $HOME/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
if [ $(command -v opam) ]; then
    eval `opam config env`
fi

# #### rbenv init's code
if [ $(command -v rbenv) ]; then
    eval "$(rbenv init -)"
fi

# #### pyenv init's code
if [ $(command -v pyenv) ]; then
    eval "$(pyenv init --path)"
    eval "$(pyenv init -)"
fi

# #### CURSOR setting
# unkown error "112yellow"
#echo -ne '\e]12;yellow\a'

# #### nvm init's code
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# #### Go lang init's code
[ -d "$HOME/go" ] && export GOPATH=$HOME/go && export PATH=$GOPATH/bin:$PATH

# k8s auto completion
[ $(command -v kubectl) ] && source <(kubectl completion zsh)

# deno
DENO_INSTALL="$HOME/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"
[ $(command -v deno) ] && source <(deno completions bash)

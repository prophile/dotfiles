# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored _approximate
zstyle ':completion:*' expand prefix suffix
zstyle ':completion:*' file-sort name
zstyle ':completion:*' ignore-parents parent pwd ..
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]} r:|[._-]=** r:|=**' 'm:{[:lower:]}={[:upper:]}'
zstyle ':completion:*' menu select=1
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle :compinstall filename '/home/al22g09/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd extendedglob notify
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install

setopt prompt_subst
autoload -Uz vcs_info
zstyle ':vcs_info:*' actionformats \
    '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f '
zstyle ':vcs_info:*' formats       \
        '%F{5}[%F{2}%b%u%F{5}]%f '
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{3}%r'

zstyle ':vcs_info:*' enable git cvs svn

# or use pre_cmd, see man zshcontrib
vcs_info_wrapper() {
  DOTS=''
  if [[ -n $(git diff-index --cached --name-only HEAD 2> /dev/null) ]] {
    DOTS="$DOTS%F{green}●"
  }
  if [[ -n $(git ls-files --modified --deleted 2> /dev/null) ]] {
    DOTS="$DOTS%F{yellow}●"
  }
  if [[ -n $(git ls-files --other --exclude-standard 2> /dev/null) ]] {
    DOTS="$DOTS%F{red}●"
  }
  zstyle ':vcs_info:*' formats \
         "%F{5}[%F{2}%b$DOTS%F{5}]%f "
  vcs_info
  if [[ -n "$vcs_info_msg_0_" ]] {
    echo "%{$fg[grey]%}${vcs_info_msg_0_}%{$reset_color%}$del"
  }
}

autoload -U colors && colors

VMODE="%{$fg[yellow]%}INS%{$reset_color%}"
function zle-keymap-select {
  if [[ $KEYMAP = "vicmd" ]] {
    VMODE="%{$fg[red]%}COM%{$reset_color%}"
  } else {
    VMODE="%{$fg[yellow]%}INS%{$reset_color%}"
  }
  zle reset-prompt
}

function accept_line {
  zle reset-prompt
  builtin zle .accept-line
  VMODE="%{$fg[yellow]%}INS%{$reset_color%}"
}
zle -N accept_line
bindkey -M vicmd "^M" accept_line

function read-vmode {
  echo $VMODE
}

RPROMPT=$'$(vcs_info_wrapper)'

zle -N zle-keymap-select

alias go=open

PROMPTCHARS='%'
MAINPROMPT="%{$fg[green]%}%1~%{$reset_color%}%# "
PROMPT=$'[$(read-vmode)] $MAINPROMPT'

# Useful commands
function psgrep() {
    ps axu | grep -v grep | grep "$@" -i --color=auto;
}

function fname() {
    find . -iname "*$@*";
}

EDITOR='mvim --remote'
VIEWER='mvim --remote -R'

alias e="$EDITOR"
alias v="$VIEWER"

PATH=/Users/alistairlynn/bin:/usr/local/bin:/usr/local/sbin:$PATH
PATH=$PATH:/Users/alistairlynn/.sr/tools/wrapper
PATH=$PATH:/usr/local/share/npm/bin
PYTHONPATH=/usr/local/lib/python2.7/site-packages

alias fewer=less

alias inkscape="/Applications/Inkscape.app/Contents/Resources/bin/inkscape"


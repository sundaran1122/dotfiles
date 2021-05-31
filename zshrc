#!/bin/zsh
PROMPT="%F{1}%f %F{12}%~%F{8}>
 %F{2}λ%f "
HISTFILE=~/.cache/zsh/zshhistory

autoload -Uz compinit; compinit
source ~/programs/xplr/xplr.zsh

bindkey -v
bindkey '^?' backward-delete-char

export SKIM_DEFAULT_OPTIONS="--height=70% --reverse --tiebreak=length,index --prompt=\"λ \""
alias cf="cd \`fd -t d | sk $SKIM_DEFAULT_OPTIONS\`"
alias nf="nvim \`fd -t f | sk $SKIM_DEFAULT_OPTIONS\`"

alias n="nvim"
alias ctagsgen="ctags --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++"
alias tsm="transmission-remote"
alias sudo="doas"
alias netchk="gping google.com facebook.com youtube.com"
alias zthr="zathura"

# git aliases
alias gs="git status"
alias gd="git diff"
alias ga="git add"
alias gr="git reset"
alias gc="git commit"
alias gcm="git commit -m"
alias gch="git checkout"
alias gb="git branch"

# autotools aliases
alias am="automake"
alias ac="autoconf"
alias arc="autoreconf"
alias arci="autoreconfi"

alias cp="cp -i"
alias rm="rm -i"

touch /dev/shm/pwd
DISABLE_AUTO_TITLE="true"
chpwd () {
  print -Pn "\e]0;zsh:%~\a"
  killall "controllemonbar" -SIGUSR2
  pwd > /dev/shm/pwd
}

cd $(cat /dev/shm/pwd) || chpwd

#nordic tty?
if [[ $TERM = "linux" ]]
then
  export PROMPT="%F{1}%f %F{10}%~%F{8}>
 %F{2}>%f "

  echo -en "\e]P02E3440"
  echo -en "\e]P1BF616A"
  echo -en "\e]P2A3BE8C"
  echo -en "\e]P3EBCB8B"
  echo -en "\e]P481A1C1"
  echo -en "\e]P5B48EAD"
  echo -en "\e]P688C0D0"
  echo -en "\e]P7D8DEE9"
  echo -en "\e]P84C566A"
  echo -en "\e]P9BF616A"
  echo -en "\e]PAA3BE8C"
  echo -en "\e]PBEBCB8B"
  echo -en "\e]PC81A1C1"
  echo -en "\e]PDB48EAD"
  echo -en "\e]PE8FBCBB"
  echo -en "\e]PFD8DEE9"

  clear
fi

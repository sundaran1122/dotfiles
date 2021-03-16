#!/bin/zsh
export PROMPT="%F{1}%f %F{12}%~%F{8}>
 %F{2}λ%f "
HISTFILE=~/.cache/zsh/zshhistory

autoload -Uz compinit; compinit

bindkey -v
bindkey '^?' backward-delete-char

alias n="nvim"
alias cf="cd \`fd -t d | fzf --tiebreak=length,index --prompt=\"λ \"\`"
alias nf="nvim \`fd -t f | fzf --tiebreak=length,index --prompt=\"λ \"\`"

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

DISABLE_AUTO_TITLE="true"
chpwd () {
  print -Pn "\e]0;zsh : %~\a"
  killall "controllemonbar" -SIGUSR2
  pwd > /tmp/pwd
}

cd $(cat /tmp/pwd) || chpwd

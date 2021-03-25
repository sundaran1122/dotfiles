#!/bin/zsh
export PROMPT="%F{1}%f %F{12}%~%F{8}>
 %F{2}λ%f "
HISTFILE=~/.cache/zsh/zshhistory

autoload -Uz compinit; compinit

bindkey -v
bindkey '^?' backward-delete-char

alias n="nvim"
alias cf="cd \`fd -t d | sk --tiebreak=length,index --prompt=\"λ \"\`"
alias nf="nvim \`fd -t f | sk --tiebreak=length,index --prompt=\"λ \"\`"
alias ctagsgen="ctags --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++ *"
alias tsm="transmission-remote"

alias cp="cp -i"
alias rm="rm -i"

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

# custom funtions
xplr () {
	while true
	do
		dirs="$(fd | grep -v \~)"
		sel=$(echo -e $dirs\\n.. | sk --tiebreak=length,score,index -c "echo -e 'delete\nmove\n' | grep '{}'" \
			-p "xplr: " --cmd-prompt="action: ")
		[[ -d $sel ]] && cd $sel && continue
		[[ -e $sel ]] && xdg-open $sel 2> /dev/null

		[[ $sel == "" ]] && return
		[[ $sel == "delete" ]] && rm -rf $(fd | grep -v \~ | sk --tiebreak=length,score,index -m -p "delete: ")

		[[ $sel == "move" ]] && mv $(fd | grep -v \~ | sk --tiebreak=length,score,index -m -p "select file: ") \
			$(fd | grep -v \~ | sk --tiebreak=length,score,index -c "fd | grep -v \~ | grep '{}' || echo {}" -i --cmd-prompt="select destination: ")

		[[ $sel == "copy" ]] && cp $(fd | grep -v \~ | sk --tiebreak=length,score,index -m -p "select file: ") \
			$(fd | grep -v \~ | sk --tiebreak=length,score,index -c "fd | grep -v \~ | grep '{}' || echo {}" -i --cmd-prompt="select destination: ")
	done
}

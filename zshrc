#!/bin/zsh

export PROMPT="%F{1}[%F{6}%n%F{1}@%F{6}%M%F{1}]%f %F{10}%~%F{8}>
%F{2}λ%f "
HISTFILE=~/.cache/zsh/zshhistory

autoload -Uz compinit; compinit

alias n="nvim"
alias cf="cd \`PATH='' /bin/find -L -O3 -type d | egrep -v '`cat ~/.config/fzf/excluded`' | fzf --tiebreak=length,index\`"
alias nf="nvim \`PATH='' /bin/find -L -O3 -type f | egrep -v '`cat ~/.config/fzf/excluded`' | fzf --tiebreak=length,index\`"

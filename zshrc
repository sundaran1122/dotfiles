#!/bin/zsh

export PROMPT="%F{1}[%F{6}%n%F{1}@%F{6}%M%F{1}]%f %F{10}%~%F{8}>
%F{2}λ%f "

autoload -Uz compinit; compinit

alias n="nvim"

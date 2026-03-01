zmodload zsh/datetime

preexec() {
  cmd_start=$EPOCHSECONDS
}

precmd() {
  local exit_code=$?
  if [[ -n $cmd_start ]]; then
    cmd_time="$(( EPOCHSECONDS - cmd_start ))s"
    unset cmd_start
  else
    cmd_time=""
  fi
  cmd_exit=$exit_code
}

PROMPT="%{$fg[blue]%}%~%{$reset_color%}"
PROMPT+='$(git_prompt_info)%{$reset_color%}'
PROMPT+=' %D{@ %H:%M %Z}'
PROMPT+=' ${cmd_time:+"%(?,%{$fg[green]%},%{$fg[red]%})${cmd_time}%(?,, ${cmd_exit})%{$reset_color%} "}'
PROMPT+='
'
PROMPT+="%{$fg[yellow]%} $%{$reset_color%}%{$fg[white]%} "

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg_bold[yellow]%}(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[yellow]%})"
ZSH_THEME_GIT_PROMPT_DIRTY="*"
ZSH_THEME_GIT_PROMPT_CLEAN=""

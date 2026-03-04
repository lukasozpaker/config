zmodload zsh/datetime

preexec() {
  cmd_start=$EPOCHSECONDS
}

precmd() {
  local exit_code=$?
  if [[ -n $cmd_start ]]; then
    local d=$(( EPOCHSECONDS - cmd_start ))
    local time_str=""

    (( d >= 3600 )) && time_str+="$(( d / 3600 ))h "
    (( d >= 60 ))   && time_str+="$(( (d % 3600) / 60 ))m "
    time_str+="$(( d % 60 ))s"

    if [[ $exit_code -eq 0 ]]; then
      cmd_time=" %{$fg[green]%}${time_str}%{$reset_color%} "
    else
      cmd_time=" %{$fg[red]%}${time_str} ${exit_code}%{$reset_color%} "
    fi
    unset cmd_start
  else
    cmd_time=""
  fi
}

PROMPT="%{$fg[blue]%}%~%{$reset_color%}"
PROMPT+='$(git_prompt_info)%{$reset_color%}'
PROMPT+=' %D{@ %H:%M %Z}'
PROMPT+='${cmd_time}'
PROMPT+='
'
PROMPT+="%{$fg[yellow]%} $%{$reset_color%}%{$fg[white]%} "

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg_bold[yellow]%}(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[yellow]%})"
ZSH_THEME_GIT_PROMPT_DIRTY="*"
ZSH_THEME_GIT_PROMPT_CLEAN=""

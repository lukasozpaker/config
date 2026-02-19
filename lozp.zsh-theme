PROMPT="%{$fg[blue]%}%~%{$reset_color%}"

PROMPT+='$(git_prompt_info)%{$reset_color%}'

PROMPT+=' %D{@ %H:%M %Z}
'

PROMPT+="%{$fg[yellow]%} $%{$reset_color%}%{$fg[white]%} "

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg_bold[yellow]%}(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[yellow]%})"

ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%}"


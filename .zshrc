# START LOZP ZSHRC CONFIG

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="lozp"

export KEYTIMEOUT=5  # kill escape deplay, 5 to be extra safe for ssh
VI_MODE_RESET_PROMPT_ON_MODE_CHANGE=false
VI_MODE_SET_CURSOR=true  # cursor shape changes
# MODE_INDICATOR="%F{yellow} [VI NORMAL MODE]%f"
# INSERT_MODE_INDICATOR=""

plugins=(
	git
	vi-mode
	zsh-autosuggestions
	zsh-syntax-highlighting
	fzf-tab
)

source $ZSH/oh-my-zsh.sh

bindkey -M viins '^[^?' backward-kill-word  # fix vi mode overriding option/alt backspace bc = esc

zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color=always $realpath'
zstyle ':fzf-tab:*' fzf-flags --height=50% --smart-case --bind='right:accept'
zstyle ':completion:*' special-dirs true
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':fzf-tab:*' switch-group '<' '>'
zstyle ':fzf-tab:complete:git-(checkout|diff|log):*' fzf-preview 'git log --oneline --color=always $word 2>/dev/null'
bindkey -M viins '^N' fzf-tab-complete


alias vim=nvim
setopt HIST_IGNORE_SPACE

# END LOZP ZSHRC CONFIG

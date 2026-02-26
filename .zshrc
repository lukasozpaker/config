# START LOZP ZSHRC CONFIG

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="lozp"


export KEYTIMEOUT=5  # kill escape deplay, 5 to be extra safe for ssh
VI_MODE_RESET_PROMPT_ON_MODE_CHANGE=true
VI_MODE_SET_CURSOR=true  # cursor shape changes
MODE_INDICATOR="%F{yellow} [VI NORMAL MODE]%f"
INSERT_MODE_INDICATOR=""

plugins=(
	git
	vi-mode
	zsh-autosuggestions
	zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

bindkey -M viins '^[^?' backward-kill-word  # fix vi mode overriding option/alt backspace bc = esc

# END LOZP ZSHRC CONFIG

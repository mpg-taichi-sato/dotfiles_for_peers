# show git branch
# https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh
source ~/.git-prompt.sh

# PROMPTの中の変数を展開するためのオプション
setopt PROMPT_SUBST

# -----------------------------
# Prompt
# -----------------------------
# %c    カレントディレクトリ(相対パス)
# %F{色指定}変えたい部分%f
PROMPT='%F{yellow}%c%f%F{green}$(__git_ps1 "(%s)")%f$ '

# Path
export PATH=~/.npm-global/bin:$PATH
export PATH="/usr/local/sbin:$PATH"
export PATH="~/.rbenv/shims:/usr/local/bin:$PATH"

if type rbenv > /dev/null 2>&1; then
  eval "$(rbenv init -)"
fi

# alias
alias ctree='tree -I "\.DS_Store|\.git|node_modules"'
alias tac='tail -r'
alias distinct='awk '\''!a[$0]++'\'

# peco
function peco-select-history() {
    BUFFER=`history -n 1 | tac | distinct | peco`
    CURSOR=${#BUFFER}
    zle reset-prompt
}

zle -N peco-select-history
bindkey '^r' peco-select-history

# m で make helpを選択実行
function makefile-select-and-run() {
  [ ! -e Makefile ] && echo "NotFound Makefile" && return
  KEY=$(make help | peco | awk '{print $1}')
  [ -n "$KEY" ] && make $KEY
}
alias m=makefile-select-and-run

# zsh-completions
if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

    autoload -Uz compinit
    compinit
fi

# zsh-syntax-highlighting
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# zsh-autosuggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# 補完候補一覧をカラー表示 '=対象=色' 35はPink
zstyle ':completion:*'  list-colors '=*=35'
# 選択中の候補に背景色付け
zstyle ':completion:*:default' menu select=2

# direnv用の設定
export EDITOR=code
if type direnv > /dev/null 2>&1; then
  eval "$(direnv hook zsh)"
fi

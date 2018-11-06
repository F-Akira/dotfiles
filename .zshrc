# 補完
autoload -U compinit
compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*:default' menu select=2

# 日本語
export LANG=ja_JP.UTF-8

# 色の設定
case ${OSTYPE} in
    darwin*)
        export LSCOLORS=gxfxcxdxbxegedabagacad
        export LS_COLORS='di=36:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
        ;;
    linux*)
        export LS_COLORS='di=01;34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
        ;;
esac
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# ビープ音なし
setopt nobeep

# ディレクトリ名のみで移動
setopt auto_cd

# 自動pushd
setopt auto_pushd

# エイリアス
alias ...='cd ../..'
alias ....='cd ../../..'
alias mkdir='(){mkdir $1;cd $1}'
alias dirs='dirs -v'
case ${OSTYPE} in
    darwin*)
        alias ls='ls -GF'
        ;;
    linux*)
        alias ls='ls -F --color=auto'
        ;;
esac

# パス追加
export PATH=$PATH:~/.local/bin

# プロンプト
PROMPT='%n:%F{green}%~%f$ '

function _window_title_cmd () {
  local pwd="${PWD/~HOME/~}"
  print -n "\e]0;"
  print -n "${pwd##*/} (${HOST%%.*})"
  print -n "\a"
}

# 履歴
HISTFILE="$HOME/.zsh_history"
HISTSIZE=100000
SAVEHIST=100000
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_no_store
setopt hist_verify
setopt share_history
setopt hist_ignore_space
setopt EXTENDED_HISTORY
function history_all { history -E 1 }
bindkey '^P' history-beginning-search-backward
bindkey '^N' history-beginning-search-forward

function _window_title_exec () {
  local pwd="${PWD/~HOME/~}"
  print -n "\e]0;"
  print -n "${1%% *}:${pwd##*/} (${HOST%%.*})"
  print -n "\a"
}

autoload -Uz add-zsh-hook

[[ "$TERM" =~ "^xterm" ]] && {
  add-zsh-hook precmd _window_title_cmd
  add-zsh-hook preexec _window_title_exec
}

# プラグイン
source $HOME/.zsh_plugin/zaw/zaw.zsh

# キーバインド
bindkey '^h' zaw-history

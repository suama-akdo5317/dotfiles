# キーバインド設定 - Peco連携
#
# Pecoを使ったインタラクティブなキーバインド設定
# 依存: peco (brew install peco)

# Ctrl+R: 履歴をインタラクティブ検索
function peco-select-history() {
    BUFFER=$(history -n -r 1 | peco --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history


# Ctrl+D: ディレクトリ移動履歴からインタラクティブ選択
function peco-cdr () {
    local selected_dir=$(cdr -l | awk '{ print $2 }' | peco)
    if [ -n "$selected_dir" ]; then
        BUFFER="cd ${selected_dir}"
        zle accept-line
    fi
    zle clear-screen
}
zle -N peco-cdr
bindkey '^d' peco-cdr


# gs: Gitブランチをインタラクティブ切り替え (macOS BSD sed用に-Eを使用)
alias gs='git switch $(git branch | sed -E "s/^[ \*]+//" | peco)'


# 利用可能なキーバインド一覧:
# - Ctrl+R  : コマンド履歴をインタラクティブ検索
# - Ctrl+D  : ディレクトリ移動履歴から選択
# - gs      : Gitブランチをインタラクティブ切り替え

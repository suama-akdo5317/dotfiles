# fzf連携キーバインド設定
#
# このファイルにはfzfを使ったインタラクティブな操作を定義します

# fzfがインストールされていない場合はスキップ
if ! command -v fzf >/dev/null 2>&1; then
    return
fi

# fzf環境変数
export FZF_DEFAULT_COMMAND="fd -H -E .git -E node_modules --color=always"
export FZF_DEFAULT_OPTS="--ansi -e --ignore-case --layout=reverse --border=rounded --height 80%"
export FZF_CTRL_T_COMMAND="fd --type f -H -E .git -E node_modules"
export FZF_CTRL_T_OPTS="--preview 'bat --color=always --style=header,grid --line-range :100 {}'"
export FZF_ALT_C_COMMAND="fd --type d -H -E .git -E node_modules"
export FZF_ALT_C_OPTS="--preview 'eza {} -h -T -F --no-user --no-time --no-filesize --no-permissions --long | head -200'"

# fzf公式キーバインド・補完の有効化（Ctrl+T, Alt+C が使えるようになる）
source <(fzf --zsh)

# =============================================================================
# 履歴検索（Ctrl+R）
# =============================================================================

function _fzf_history_search() {
    local selected
    selected=$(fc -l 1 | awk '{ $1=""; print $0 }' | awk '!seen[$0]++' | fzf --tac --no-sort --query="$LBUFFER")
    if [[ -n "$selected" ]]; then
        BUFFER="$selected"
        CURSOR=${#BUFFER}
    fi
    zle reset-prompt
}
zle -N _fzf_history_search
bindkey '^R' _fzf_history_search

# =============================================================================
# Gitブランチ切り替え（gs）
# =============================================================================

function gs() {
    local branch
    branch=$(git branch --all 2>/dev/null \
        | grep -v HEAD \
        | sed 's/^[* ]*//' \
        | sed 's|remotes/origin/||' \
        | sort -u \
        | fzf --prompt="branch> ")
    if [[ -n "$branch" ]]; then
        git switch "$branch"
    fi
}

# =============================================================================
# Gitブランチ削除（gbd）
# =============================================================================

function gbd() {
    local branches
    branches=$(git branch 2>/dev/null | grep -v '^\*' | fzf -m --prompt="delete branch> ")
    if [[ -n "$branches" ]]; then
        echo "$branches" | xargs git branch -D
    fi
}

# カスタム関数定義
#
# このファイルには汎用的なシェル関数を定義します


# =============================================================================
# zoxide + git worktree 対応
# =============================================================================

# git worktree を跨いだパス変換
# 別の worktree のパスに飛ぼうとすると、現在の worktree の対応パスに変換する
function __zoxide_worktree_convert() {
    local target_path="$1"

    local current_toplevel
    current_toplevel="$(git rev-parse --show-toplevel 2>/dev/null)" || return 1

    local git_common_dir
    git_common_dir="$(git rev-parse --git-common-dir 2>/dev/null)" || return 1

    local worktrees
    worktrees="$(git worktree list --porcelain 2>/dev/null)" || return 1

    local worktree_root
    while IFS= read -r line; do
        if [[ "$line" =~ ^worktree\ (.+)$ ]]; then
            worktree_root="${match[1]}"
            if [[ "$target_path" == "$worktree_root"* ]] && [[ "$worktree_root" != "$current_toplevel" ]]; then
                local relative_path="${target_path#$worktree_root}"
                local converted_path="${current_toplevel}${relative_path}"
                if [[ -d "$converted_path" ]]; then
                    echo "$converted_path"
                    return 0
                fi
            fi
        fi
    done <<< "$worktrees"

    return 1
}

function cd() {
    if ! typeset -f __zoxide_z > /dev/null 2>&1; then
        builtin cd "$@"
        return
    fi

    if [[ "$#" -eq 0 ]] || [[ "$1" = '-' ]] || [[ "$1" =~ ^[-+][0-9]$ ]]; then
        __zoxide_z "$@"
        return
    fi

    if [[ -d "$1" ]]; then
        __zoxide_z "$@"
        return
    fi

    local result
    result="$(\command zoxide query --exclude "$(__zoxide_pwd)" -- "$@" 2>/dev/null)"

    if [[ -z "$result" ]]; then
        __zoxide_z "$@"
        return
    fi

    local converted
    converted="$(__zoxide_worktree_convert "$result")"

    if [[ -n "$converted" ]]; then
        __zoxide_cd "$converted"
    else
        __zoxide_cd "$result"
    fi
}

function cdi() {
    local result
    result="$(\command zoxide query --interactive -- "$@" 2>/dev/null)"

    if [[ -z "$result" ]]; then
        return 1
    fi

    local converted
    converted="$(__zoxide_worktree_convert "$result")"

    if [[ -n "$converted" ]]; then
        __zoxide_cd "$converted"
    else
        __zoxide_cd "$result"
    fi
}

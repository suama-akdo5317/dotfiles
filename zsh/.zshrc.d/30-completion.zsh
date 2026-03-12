# 起動時に/.zsh/completionsを有効にする
fpath=(
    ${HOME}/.zsh/completions
    ${fpath}
)

# compinit最適化: 1日1回のみ再生成
autoload -Uz compinit
if [[ -n ${ZDOTDIR:-$HOME}/.zcompdump(#qN.mh+24) ]]; then
    compinit
else
    compinit -C
fi

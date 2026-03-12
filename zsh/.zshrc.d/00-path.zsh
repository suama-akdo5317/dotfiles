# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Set XDG base directories
export XDG_CONFIG_HOME="$HOME/.config"

# deno
export DENO_INSTALL="$HOME/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# pngquant
export PNGQUANT_BINARY=$(which pngquant)
export SKIP_PNGQUANT_BINARY_DOWNLOAD=true

# direnv
eval "$(direnv hook zsh)"

# mise
# PATH="$HOME/.local/share/mise/shims:$PATH"
# eval "$(/opt/homebrew/bin/mise activate zsh)"
eval "$(mise activate zsh)"

# 1Password SSH Agent
# Note: SSHエージェント機能のみを使用する場合、op signinは不要
export SSH_AUTH_SOCK="$HOME/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"

# 1Password CLIを頻繁に使う場合のみ、以下のコメントを外してください
# if ! op account get &>/dev/null; then
#     eval $(op signin)
# fi

# Docker
export PATH="$PATH:/Applications/Docker.app/Contents/Resources/bin"

# zoxide
eval "$(zoxide init zsh)"

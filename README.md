# dotfiles

macOS開発環境の設定を一元管理するdotfilesリポジトリ。シンボリックリンクで各ツールから参照する構成。

## 構成

```
~/.dotfiles/
├── .agents/       # Agent Skills（Claude Code / Codex / Gemini 共通管理）
├── .claude/       # Claude Code 設定（CLAUDE.md, agents, commands, MCP等）
├── brew/          # Homebrew パッケージ管理（Brewfile）
├── docs/          # 機能一覧・キーバインドなどの補足ドキュメント
├── ghostty/       # Ghostty ターミナル設定
├── git/           # Git設定（.gitconfig, hooks, gitleaks）
├── sheldon/       # zshプラグインマネージャ設定
├── starship/      # クロスシェルプロンプト設定
├── tmux/          # tmux設定（TPMプラグイン管理）
└── zsh/           # zsh設定（モジュール化された .zshrc.d/）
```

各ディレクトリの詳細は、それぞれの `README.md` を参照:

- [.agents/README.md](.agents/README.md) — Agent Skills の共通管理
- [.claude/README.md](.claude/README.md) — Claude Code 設定とシムリンク対応表
- [brew/README.md](brew/README.md) — Brewfileの運用フロー
- [starship/README.md](starship/README.md) — プロンプトのカスタマイズ
- [zsh/README.md](zsh/README.md) — zsh設定のモジュール構成

補足資料:

- [docs/features.md](docs/features.md) — 導入している機能の一覧
- [docs/terminal-keybindings.md](docs/terminal-keybindings.md) — ターミナルキーバインド チートシート

## 新しいマシンでのセットアップ

### 1. clone（submodule込み）

```zsh
git clone --recurse-submodules git@github.com:suama-akdo5317/dotfiles.git ~/.dotfiles
```

既存clone後にsubmoduleだけ取得する場合:

```zsh
git submodule update --init --recursive
```

### 2. Homebrewパッケージのインストール

```zsh
brew bundle install --file=~/.dotfiles/brew/Brewfile
```

### 3. シムリンクの作成

```zsh
DOTFILES="$HOME/.dotfiles"

# zsh
ln -sf "$DOTFILES/zsh/.zshenv" "$HOME/.zshenv"
ln -sf "$DOTFILES/zsh/.zshrc"  "$HOME/.config/zsh/.zshrc"
ln -sfn "$DOTFILES/zsh/.zshrc.d" "$HOME/.config/zsh/.zshrc.d"

# git
ln -sf "$DOTFILES/git/.gitconfig" "$HOME/.config/git/.gitconfig"
ln -sf "$DOTFILES/git/ignore"     "$HOME/.config/git/ignore"

# starship
ln -sf "$DOTFILES/starship/starship.toml" "$HOME/.config/starship.toml"

# sheldon
ln -sf "$DOTFILES/sheldon/.sheldon.toml" "$HOME/.config/sheldon/plugins.toml"

# tmux
ln -sf "$DOTFILES/tmux/.tmux.conf" "$HOME/.tmux.conf"

# ghostty
ln -sf "$DOTFILES/ghostty/config" "$HOME/.config/ghostty/config"
```

Claude Code / Agent Skills 関連のシムリンクは [.claude/README.md](.claude/README.md) と [.agents/README.md](.agents/README.md) を参照。

### 4. シェルの再起動

```zsh
exec zsh
```

## 依存ツール

- [Homebrew](https://brew.sh/) — パッケージマネージャ
- [sheldon](https://github.com/rossmacarthur/sheldon) — zshプラグインマネージャ
- [starship](https://starship.rs/) — プロンプト
- [mise](https://mise.jdx.dev/) — ランタイムマネージャ
- [direnv](https://direnv.net/) — ディレクトリ別環境変数管理
- [fzf](https://github.com/junegunn/fzf) — インタラクティブフィルタリング
- [git-delta](https://github.com/dandavison/delta) — git diffのシンタックスハイライト

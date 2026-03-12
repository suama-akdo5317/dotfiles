# ============================================================
# Taps
# ============================================================
tap "ariga/tap"          # atlas (DB schema migration)
tap "bearer/tap"         # bearer (API security scanner)
tap "homebrew/bundle"
tap "homebrew/services"

# ============================================================
# Dependencies (auto-installed, required by other tools)
# ============================================================
brew "libpng"            # 画像ライブラリ
brew "xz"                # 圧縮ライブラリ
brew "jpeg-xl"           # 画像フォーマット
brew "aom"               # 動画コーデック
brew "glib"              # GLibライブラリ
brew "libavif"           # AVIFフォーマット (libpng/jpeg-xl依存)
brew "nss"               # mkcert依存
brew "cryptography"      # Pythonの暗号ライブラリ

# ============================================================
# Shell / Terminal
# ============================================================
brew "direnv"            # ディレクトリごとに .envrc で環境変数を管理
brew "fzf"               # ファジーファインダー
brew "mise"              # 言語バージョン管理 (node/ruby/python等)
brew "overmind"          # Procfileベースのプロセスマネージャー
brew "starship"          # シェルプロンプト
brew "tmux"              # ターミナルマルチプレクサ
brew "zoxide"            # スマートな cd コマンド

# ============================================================
# File / Text Tools
# ============================================================
brew "bat"               # cat の代替 (シンタックスハイライト付き)
brew "eza"               # ls の代替
brew "fd"                # find の代替
brew "jq"                # JSONプロセッサ
brew "pv"                # パイプの進捗表示
brew "ripgrep"           # grep の代替 (高速)
brew "tree"              # ディレクトリツリー表示
brew "wget"              # ファイルダウンロード

# ============================================================
# Git
# ============================================================
brew "git"               # バージョン管理
brew "git-secrets"       # シークレットのコミットを防止
brew "gitleaks"          # Gitリポジトリのシークレット検出
brew "pre-commit"        # プリコミットフック管理

# ============================================================
# Security
# ============================================================
brew "gnupg"             # GPG暗号化・署名
brew "mkcert"            # ローカルSSL証明書の生成
brew "trivy"             # コンテナ/コードのセキュリティスキャン
brew "bearer/tap/bearer" # APIセキュリティスキャン

# ============================================================
# AWS
# ============================================================
brew "aws-sso-cli"                  # AWS SSO 認証管理
brew "aws-vault", link: false       # AWS認証情報のセキュアな管理
brew "awscli"                       # AWS CLI
brew "cloudflared"                  # Cloudflare Tunnel

# ============================================================
# Development
# ============================================================
brew "http-server"                  # 簡易HTTPサーバー (静的ファイル確認用)
brew "lazydocker"                   # Docker管理TUI
brew "mysql-client@8.0", link: true # MySQLクライアント
brew "ariga/tap/atlas", link: false # DBスキーママイグレーション

# ============================================================
# Cask (GUI / Binary)
# ============================================================
cask "1password-cli"          # 1Password CLI
cask "aws-vault-binary"       # aws-vault バイナリ (brew版と併用)
cask "copilot-cli"            # AWS Copilot CLI
cask "keyclu"                 # キーボードショートカット一覧表示
cask "session-manager-plugin" # AWS Session Manager Plugin
cask "wezterm"                # ターミナルエミュレータ

# ============================================================
# VS Code Extensions
# ============================================================

# --- Infrastructure / Config ---
vscode "4ops.terraform"                  # Terraform
vscode "redhat.vscode-yaml"              # YAML
vscode "grafana.vscode-jsonnet"          # Jsonnet (Grafana)
vscode "github.vscode-github-actions"    # GitHub Actions
vscode "ms-vscode.makefile-tools"        # Makefile

# --- PHP / Laravel ---
vscode "amiralizadeh9480.laravel-extra-intellisense"
vscode "onecentlin.laravel-blade"        # Bladeテンプレート
vscode "shufo.vscode-blade-formatter"    # Blade formatter
vscode "xdebug.php-debug"                # PHP デバッガ
vscode "ilich8086.coldfusion"            # ColdFusion

# --- Frontend ---
vscode "bradlc.vscode-tailwindcss"       # Tailwind CSS
vscode "dbaeumer.vscode-eslint"          # ESLint
vscode "ecmel.vscode-html-css"           # HTML/CSS
vscode "esbenp.prettier-vscode"          # Prettier
vscode "formulahendry.auto-rename-tag"   # HTMLタグ自動リネーム
vscode "glenn2223.live-sass"             # SCSS/SASSコンパイル
vscode "pranaygp.vscode-css-peek"        # CSS定義へジャンプ
vscode "ritwickdey.liveserver"           # Live Server
vscode "vincaslt.highlight-matching-tag" # 対応タグのハイライト

# --- Git ---
vscode "eamodio.gitlens"                 # GitLens
vscode "mhutchie.git-graph"              # Gitグラフ表示

# --- Editor UX ---
vscode "alefragnani.bookmarks"           # ブックマーク
vscode "bierner.markdown-mermaid"        # Mermaid図 in Markdown
vscode "irongeek.vscode-env"             # .envファイルのハイライト
vscode "janisdd.vscode-edit-csv"         # CSVエディタ
vscode "mechatroner.rainbow-csv"         # CSV列カラー表示
vscode "mohsen1.prettify-json"           # JSON整形
vscode "mosapride.zenkaku"               # 全角スペースの可視化
vscode "oderwat.indent-rainbow"          # インデントのカラー表示
vscode "ryu1kn.partial-diff"             # テキスト差分表示
vscode "streetsidesoftware.code-spell-checker" # スペルチェック
vscode "vscode-icons-team.vscode-icons"  # ファイルアイコン

# --- Remote / SSH ---
vscode "ms-vscode-remote.remote-ssh"
vscode "ms-vscode-remote.remote-ssh-edit"
vscode "ms-vscode.remote-explorer"
vscode "natizyskunk.sftp"                # SFTP同期

# --- AI ---
vscode "anthropic.claude-code"           # Claude Code
vscode "github.copilot-chat"             # GitHub Copilot

# --- Locale ---
vscode "ms-ceintl.vscode-language-pack-ja" # 日本語UIパック

# --- Legacy / Misc ---
vscode "withfig.fig"                     # Fig (補完ツール、現在はWarp等に統合)

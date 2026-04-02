# Claude Code 設定

`~/.claude/` の設定ファイルを dotfiles で管理するためのディレクトリ。
このディレクトリ内のファイルは `~/.claude/` からシムリンクされる。

## ディレクトリ構成

```
~/.dotfiles/
├── ccmanager/
│   └── config.json            # CCManager 設定（キーバインド・worktree・プリセット等）
└── .claude/
    ├── CLAUDE.md              # グローバル指示・ルール
    ├── settings.json          # Claude Code 設定（権限・テーマ等）
    ├── settings.local.json    # マシン固有設定（gitignore 対象）
    ├── mcp.json               # MCP サーバー定義
    ├── .textlintrc.json       # textlint 設定
    ├── agents/                # カスタムサブエージェント定義
    ├── commands/              # カスタムスラッシュコマンド（スキル）
    ├── plugins/               # Claude Code プラグイン（git submodule で管理）
    │   └── everything-claude-code/   # https://github.com/affaan-m/everything-claude-code
    └── scripts/               # MCP サーバー起動ラッパースクリプト（1Password 連携）
        ├── .env               # Kibela 接続先設定
        ├── context7-mcp.sh
        └── kibela-mcp.sh
```

## シムリンク対応表

| シムリンク（実際の場所） | 実体（dotfiles） |
|---|---|
| `~/.claude/CLAUDE.md` | `~/.dotfiles/.claude/CLAUDE.md` |
| `~/.claude/settings.json` | `~/.dotfiles/.claude/settings.json` |
| `~/.claude/.textlintrc.json` | `~/.dotfiles/.claude/.textlintrc.json` |
| `~/.claude/.mcp.json` | `~/.dotfiles/.claude/mcp.json` |
| `~/.claude/agents/` | `~/.dotfiles/.claude/agents/` |
| `~/.claude/commands/` | `~/.dotfiles/.claude/commands/` |
| `~/.config/ccmanager/config.json` | `~/.dotfiles/ccmanager/config.json` |

## gitignore 対象（~/.dotfiles/.gitignore）

以下は自動生成・履歴系のため git 管理しない:

- `history.jsonl` / `command_history.log` — 会話・コマンド履歴
- `file-history/` / `session-env/` / `sessions/` / `shell-snapshots/` — セッション系
- `cache/` / `downloads/` / `paste-cache/` / `debug/` — キャッシュ・一時ファイル
- `statsig/` / `telemetry/` / `stats-cache.json` / `policy-limits.json` — 計測・ポリシー
- `backups/` / `ide/` / `todos/` — ランタイム生成
- `projects/` — プロジェクト別メモリ（機密情報を含む可能性）
- `settings.local.json` — マシン固有設定

## 新マシンでのセットアップ

### 1. clone（submodule 込み）

```zsh
git clone --recurse-submodules https://github.com/kwuz/.dotfiles.git ~/.dotfiles
```

既存の clone に submodule を後から取得する場合:

```zsh
git submodule update --init --recursive
```

### 2. シムリンクの作成

```zsh
DOTFILES="$HOME/.dotfiles"
CLAUDE="$HOME/.claude"

# Claude Code
ln -sf  "$DOTFILES/.claude/CLAUDE.md"        "$CLAUDE/CLAUDE.md"
ln -sf  "$DOTFILES/.claude/settings.json"    "$CLAUDE/settings.json"
ln -sf  "$DOTFILES/.claude/.textlintrc.json" "$CLAUDE/.textlintrc.json"
ln -sf  "$DOTFILES/.claude/mcp.json"         "$CLAUDE/.mcp.json"
ln -sfn "$DOTFILES/.claude/agents"           "$CLAUDE/agents"
ln -sfn "$DOTFILES/.claude/commands"         "$CLAUDE/commands"

# CCManager
mkdir -p "$HOME/.config/ccmanager"
ln -sf  "$DOTFILES/ccmanager/config.json"    "$HOME/.config/ccmanager/config.json"
```

### 3. プラグインのセットアップ

```zsh
# インストールスクリプトを実行（agents / commands / skills 等を ~/.claude/ に展開）
bash "$HOME/.dotfiles/.claude/plugins/everything-claude-code/install.sh"
```

## プラグインの更新

```zsh
git submodule update --remote .claude/plugins/everything-claude-code
```

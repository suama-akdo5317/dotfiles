# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## リポジトリの性質

macOS開発環境の設定を一元管理するdotfilesリポジトリ。**すべての設定ファイルの実体はこのリポジトリ内に置き、各ツールのデフォルト設定パス（`~/.zshrc`、`~/.claude/CLAUDE.md`、`~/.claude/agents/` 等）からシンボリックリンクで参照する**構成。

このため、設定を変更する際は必ず `~/.dotfiles/` 配下の実体ファイルを編集すること。シムリンク先（`~/.zshrc` や `~/.claude/agents/*.md` など）を直接編集しても、それは実体ファイルを編集していることと同義だが、シムリンクが未設定の新環境ではリポジトリ側のみが正となる。

## ディレクトリ構成と各READMEの役割

トップレベルの詳細はディレクトリごとに `README.md` が分担している。**このCLAUDE.mdでは概要のみ扱い、詳細は各READMEを参照する**。

| ディレクトリ | 内容 | 詳細 |
|---|---|---|
| `.agents/` | Agent Skills の実体（Claude Code / Codex / Gemini 共通） | `.agents/README.md` |
| `.claude/` | Claude Code 設定一式（CLAUDE.md, agents, commands, MCP, plugins） | `.claude/README.md` |
| `brew/` | Homebrew パッケージ管理（Brewfile） | `brew/README.md` |
| `git/` | Git設定（.gitconfig, hooks, gitleaks） | — |
| `zsh/` | モジュール化された `.zshrc.d/`（番号プレフィックスでロード順制御） | `zsh/README.md` |
| `starship/` | クロスシェルプロンプト設定 | `starship/README.md` |
| `sheldon/` | zshプラグインマネージャ設定 | — |
| `tmux/` | tmux設定（TPMプラグイン、submodule管理） | — |
| `ghostty/` | Ghosttyターミナル設定 | — |
| `docs/` | 導入機能一覧・キーバインドのチートシート | — |

`.claude/plugins/everything-claude-code` は git submodule。更新は `git submodule update --remote .claude/plugins/everything-claude-code`。

## `.claude/CLAUDE.md` に関する重要な注意

`.claude/CLAUDE.md` は「このdotfilesリポジトリの説明」ではなく、**シムリンク経由で `~/.claude/CLAUDE.md` として使われる、Claude Codeへのグローバル指示ファイルの実体**である。名前が同じ `CLAUDE.md` でも、リポジトリルートの本ファイル（あなたが今読んでいるもの）とは役割が異なる。`.claude/CLAUDE.md` を編集する＝全プロジェクトに影響するグローバルルールを変更することになるため、変更時は影響範囲を意識すること。

## よく使うコマンド

### zsh設定の反映確認

```bash
source ~/.config/zsh/.zshrc
# または
source-zshrc
```

新しい設定ファイルを追加する場合は `.zshrc.d/` 配下に番号プレフィックス付きで作成する（例: `35-custom.zsh`）。ロード順は `00-path.zsh` → `90-local.zsh` の順。**機密情報・マシン固有設定は `90-local.zsh` に書く**（`.gitignore` でコミット対象外）。

### Brewfileの更新フロー

```bash
brew install <package>
brew bundle dump --force --file=~/.dotfiles/brew/Brewfile
# 差分を確認し、意図したパッケージのみ残す（依存ライブラリはDependenciesセクションにまとめる）
git diff brew/Brewfile
git add brew/Brewfile && git commit -m "brew: add <package>"
```

### 新しいマシンでのセットアップ

```bash
git clone --recurse-submodules git@github.com:suama-akdo5317/dotfiles.git ~/.dotfiles
brew bundle install --file=~/.dotfiles/brew/Brewfile
```

シムリンク作成コマンドの全量は `README.md`・`.claude/README.md`・`.agents/README.md` を参照。

### Agent Skillsの追加

```bash
mkdir ~/.dotfiles/.agents/skills/my-skill
# SKILL.md を作成（name, description のフロントマター必須）
```

シムリンク経由でClaude Code / Codex / Geminiから自動認識される。**Copilotはグローバルスキル非対応**のため対象外（各プロジェクトで個別管理）。

## Markdown執筆時のルール

`.textlintrc.json`（`.claude/.textlintrc.json`）で `preset-ja-technical-writing` と `@textlint-ja/preset-ai-writing` を有効化している。このリポジトリ内のMarkdownを編集する際は日本語技術文書としての体裁（表記ゆれ・冗長表現など）に注意する。

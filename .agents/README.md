# ~/.agents

Agent Skills の共通管理ディレクトリ。スキルの実体を dotfiles で一元管理し、各ツールからシンボリックリンクで参照する。

- https://skills.sh/
- [Agent Skills 標準仕様](https://github.com/anthropics/agent-skills)

## 構成

```
~/.dotfiles/.agents/
├── README.md
├── skill-lock.json        # npx skills のロックファイル（実体）
└── skills/                # スキルの実体（Git管理）
    ├── browser-use/SKILL.md
    ├── context7-mcp/SKILL.md
    └── find-skills/SKILL.md

~/.agents/
├── .skill-lock.json  → ~/.dotfiles/.agents/skill-lock.json
└── skills/           → ~/.dotfiles/.agents/skills/

~/.claude/
└── skills/           → ~/.dotfiles/.agents/skills/
```

## 対応ツール

| ツール | スキル参照先 | 管理方式 |
|--------|------------|---------|
| Claude Code | `~/.claude/skills/` → dotfiles | グローバル（シンボリックリンク） |
| Codex / Gemini | `~/.agents/skills/` → dotfiles | グローバル（シンボリックリンク） |

> **Note: Copilot はグローバルスキルに非対応。** Copilot はプロジェクト内の `.github/skills/`、`.claude/skills/`、`.agents/skills/` のみを走査するため、この dotfiles の管理対象外。各プロジェクトで個別に管理すること。

## セットアップ

新しいマシンでは以下を実行：

```sh
# skill-lock.json のリンク
ln -sf ~/.dotfiles/.agents/skill-lock.json ~/.agents/.skill-lock.json

# skills ディレクトリのリンク
mkdir -p ~/.agents ~/.claude
ln -sf ~/.dotfiles/.agents/skills ~/.agents/skills
ln -sf ~/.dotfiles/.agents/skills ~/.claude/skills
```

## スキルの追加

`~/.dotfiles/.agents/skills/` にディレクトリを作成し、`SKILL.md` を配置する。シンボリックリンク経由で全ツールから自動認識される。

```sh
mkdir ~/.dotfiles/.agents/skills/my-skill
# SKILL.md を作成（name, description のフロントマター必須）
```

## npx skills で追加したスキルの復元

```sh
npx skills sync
```

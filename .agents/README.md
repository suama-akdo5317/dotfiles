# ~/.agents

`npx skills` によるスキルパッケージマネージャの設定を管理します。

- https://skills.sh/

## 構成

```
~/.dotfiles/.agents/
└── skill-lock.json   # インストール済みスキルのロックファイル（実体）

~/.agents/
├── .skill-lock.json  → ~/.dotfiles/.agents/skill-lock.json（シムリンク）
└── skills/           # インストール済みパッケージ（Git管理外）
```

## セットアップ

```sh
ln -sf ~/.dotfiles/.agents/skill-lock.json ~/.agents/.skill-lock.json
```

## スキルの復元

新しいマシンでは以下を実行：

```sh
npx skills sync
```

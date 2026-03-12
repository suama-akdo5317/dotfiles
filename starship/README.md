# Starship設定

クロスシェル対応の高速プロンプト

## 概要

Starshipは、Rustで書かれた高速でカスタマイズ可能なシェルプロンプトです。
zsh、bash、fishなど複数のシェルに対応しています。

## ディレクトリ構造

```
starship/
└── starship.toml    # Starship設定ファイル
```

## 設定内容

### 基本設定
- **タイムアウト**: 500ms
- **改行**: プロンプト前に1行追加

### ディレクトリ表示
- **スタイル**: シアン色、太字
- **表示**: 絶対パス全体
- **リポジトリルート**: 無効（常にフルパスを表示）

### Git表示
- **ブランチ**: 紫色、太字
- **ステータス記号**:
  - `!`: 変更あり（modified）
  - `+`: ステージ済み（staged）
  - `?`: 未追跡（untracked）
  - `$`: スタッシュあり
  - `✘`: 削除済み
  - `»`: リネーム済み
  - `⇡n`: n個のコミットが先行
  - `⇣n`: n個のコミットが遅延

### プロンプト記号
- **成功**: `❯`（緑色）
- **エラー**: `❯`（赤色）
- **Viコマンドモード**: `❮`（緑色）

### 言語バージョン表示
プロジェクトで使用している言語のバージョンを自動検出して表示：
- **Go**: `go 1.21.0`
- **Node.js**: `node 20.0.0`
- **Python**: `py 3.11.0`
- **Rust**: `rs 1.70.0`

## 表示例

```
/Users/kwuz/Go/todo-go-clean feature/transaction (!)
❯
```

```
/Users/kwuz/Projects/myapp main (+?) go 1.21.0
❯
```

## カスタマイズ

### ディレクトリの短縮表示

フルパスが長すぎる場合、短縮表示にできます：

```toml
[directory]
truncation_length = 3  # 3階層まで表示
truncate_to_repo = true  # リポジトリルートから表示
```

### Git記号のカスタマイズ

シンプルにしたい場合：

```toml
[git_status]
modified = "*"
staged = "+"
untracked = "?"
```

### 言語表示の無効化

特定の言語を非表示にする：

```toml
[nodejs]
disabled = true
```

## 公式ドキュメント

- [Starship公式サイト](https://starship.rs/)
- [設定ガイド](https://starship.rs/config/)
- [プリセット集](https://starship.rs/presets/)

## トラブルシューティング

### プロンプトが表示されない

1. Starshipがインストールされているか確認：
   ```bash
   starship --version
   ```

2. 環境変数が設定されているか確認：
   ```bash
   echo $STARSHIP_CONFIG
   # /Users/username/.config/starship/starship.toml と表示されるはず
   ```

3. zsh設定で初期化されているか確認：
   ```bash
   grep starship ~/.config/zsh/.zshrc.d/60-prompt.zsh
   ```

### プロンプトが遅い

タイムアウトを短くする：

```toml
command_timeout = 100  # 100msに短縮
```

または、不要な言語モジュールを無効化：

```toml
[nodejs]
disabled = true

[python]
disabled = true
```

### Git情報が表示されない

リポジトリ内にいることを確認：

```bash
git status
```

Git設定が正しいか確認：

```bash
git config --list
```

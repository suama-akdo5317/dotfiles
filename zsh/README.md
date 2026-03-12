# Zsh設定

このディレクトリには、モジュール化されたZshの設定ファイルが含まれています。

## ディレクトリ構造

```
zsh/
├── .zshrc                      # メインのZsh設定ファイル（.zshrc.d/配下をロード）
└── .zshrc.d/                   # モジュール化された設定ファイル
    ├── 00-path.zsh             # PATH設定、ツール初期化（mise、direnv等）
    ├── 10-aliases.zsh          # 各種エイリアス（ls、git、安全化コマンド等）
    ├── 20-functions.zsh        # カスタム関数定義（予約）
    ├── 30-completion.zsh       # 補完システム設定（最適化済み）
    ├── 40-keybindings.zsh      # Mac用基本キーバインド（Option+矢印等）
    ├── 41-keybinds-fzf.zsh     # fzf連携（Ctrl+R履歴検索、gsブランチ切替）
    ├── 50-plugins.zsh          # プラグイン設定（予約）
    ├── 60-prompt.zsh           # プロンプトカスタマイズ、Git情報表示
    ├── 70-history.zsh          # 履歴設定（50,000件、重複削除、共有）
    ├── 80-options.zsh          # Zshオプション（auto_cd、correct等）
    └── 90-local.zsh            # ローカル固有設定（Git管理外推奨）
```

## ファイルの役割

### コア設定

- **[.zshrc](.zshrc)** - メインの設定ファイル。`.zshrc.d/`配下のすべての`.zsh`ファイルを自動読み込み

### `.zshrc.d/`配下のモジュール

番号プレフィックスはロード順を制御しています（00 → 90の順に読み込まれます）。

#### 00-10: 環境設定

- **[00-path.zsh](.zshrc.d/00-path.zsh)** - PATH設定、ツールの初期化
  - Deno、pngquant、direnv、mise、1Password SSH Agent、Docker
- **[10-aliases.zsh](.zshrc.d/10-aliases.zsh)** - 各種エイリアス定義
  - 基本エイリアス（ls、ll等）
  - 安全化エイリアス（rm -i、mv -i、cp -i）
  - Gitエイリアス（gst、ga、gc等）
  - 便利エイリアス（finder、myip等）

#### 20-29: 関数定義

- **[20-functions.zsh](.zshrc.d/20-functions.zsh)** - カスタム関数定義用（予約）

#### 30-50: 補完・キーバインド・プラグイン

- **[30-completion.zsh](.zshrc.d/30-completion.zsh)** - 補完システム設定（最適化済み）
- **[40-keybindings.zsh](.zshrc.d/40-keybindings.zsh)** - Mac用基本キーバインド設定
  - Option+矢印: 単語移動
  - Option+Delete: 単語削除
  - Ctrl+A/E: 行頭/行末移動
  - Option+Z: 元に戻す
- **[50-plugins.zsh](.zshrc.d/50-plugins.zsh)** - プラグイン設定用（予約）

#### 60-90: UI・動作設定

- **[60-prompt.zsh](.zshrc.d/60-prompt.zsh)** - プロンプトのカスタマイズとGit情報表示
- **[70-history.zsh](.zshrc.d/70-history.zsh)** - 履歴設定（50,000件、重複削除、履歴共有）
- **[80-options.zsh](.zshrc.d/80-options.zsh)** - Zshオプション設定
- **[90-local.zsh](.zshrc.d/90-local.zsh)** - ローカル固有の設定用（Git管理外推奨）

## 主な機能

### 1. Gitブランチ切り替え（fzf連携）

```bash
# gsコマンドでインタラクティブにブランチ切り替え
gs
```

### 2. 履歴検索（fzf連携）

```bash
# Ctrl+Rで履歴をインタラクティブ検索
```

### 3. ディレクトリ移動履歴

```bash
# Ctrl+Dで過去に訪れたディレクトリへ移動
```

### 4. 便利なエイリアス

```bash
gst          # git status
ga           # git add
gc           # git commit
gp           # git push
gl           # git log --oneline
gu           # git reset HEAD~1
ll           # ls -la
finder       # Finderで現在のディレクトリを開く
myip         # 自分のIPアドレスを確認
```

### 5. Mac用キーバインド

- **Option+←/→**: 単語単位で移動
- **Option+Delete**: 前の単語を削除
- **Ctrl+W**: 前の単語を削除
- **Ctrl+A/E**: 行頭/行末に移動
- **Ctrl+U/K**: 行頭/行末まで削除
- **Option+Z**: 元に戻す

## パフォーマンス最適化

### compinit最適化

補完システムは1日1回のみ再生成され、起動速度が改善されています。

### 1Password最適化

SSH Agent機能のみを使用するため、`op signin`は不要になりました（認証ダイアログが表示されません）。

## カスタマイズ方法

### 新しい設定を追加する

1. `.zshrc.d/`配下に新しい`.zsh`ファイルを作成
2. ファイル名の先頭に番号をつけてロード順を制御（例: `35-custom.zsh`）
3. シェルを再起動または`source ~/.config/zsh/.zshrc`を実行

### ローカル固有の設定

機密情報やマシン固有の設定は `90-local.zsh` に記述してください。

## トラブルシューティング

### 設定が反映されない場合

```bash
# 設定を再読み込み
source ~/.config/zsh/.zshrc

# または
source-zshrc
```

### 補完が効かない場合

```bash
# 補完キャッシュを削除して再生成
rm ~/.zcompdump*
exec zsh
```

### fzfコマンドが動かない場合

```bash
# fzfがインストールされているか確認
which fzf

# Homebrewでインストール
brew install fzf
```

## 依存ツール

以下のツールがインストールされていることを前提としています：

- **必須**
  - mise (ランタイムマネージャー)
  - direnv (ディレクトリ別環境変数管理)

- **推奨**
  - fzf (インタラクティブフィルタリング)
  - 1Password CLI (パスワード管理)

## メンテナンス

### ファイルの整理

空のファイルや使用していないファイルは、コメントで用途を記載しています。
将来的に使用する予定がない場合は削除しても問題ありません。

### アップデート履歴

- **2025-01-10**:
  - 設定の重複解消、パフォーマンス最適化、履歴設定追加
  - キーバインド設定を分離（40-keybindings.zsh + 41-keybinds-fzf.zsh）
  - エイリアスを10-aliases.zshに統合（safe-commands.zsh削除）
  - 1Password認証ダイアログ問題を解決（SSH Agent専用化）
  - 依存関係の明確化とファイル構成の最適化
- 初期バージョン: モジュール化構造の採用

## 参考リンク

- [Zsh Documentation](http://zsh.sourceforge.net/Doc/)
- [fzf](https://github.com/junegunn/fzf)
- [mise](https://mise.jdx.dev/)
- [direnv](https://direnv.net/)

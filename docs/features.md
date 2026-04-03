# dotfiles 機能一覧

## fzf 拡張

**ファイル:** `zsh/.zshrc.d/41-keybinds-fzf.zsh`, `zsh/.zshrc.d/10-aliases.zsh`

| 機能 | 操作 | 説明 |
|------|------|------|
| ファイル検索 | `Ctrl+T` | `bat` によるシンタックスハイライトプレビュー付きでファイルを選択 |
| ディレクトリ移動 | `Alt+C` | `eza` によるツリープレビュー付きでディレクトリに移動 |
| 履歴検索 | `Ctrl+R` | fzf でコマンド履歴をインクリメンタル検索 |
| ブランチ切り替え | `gs` | fzf でブランチを選択して切り替え |
| ブランチ削除 | `gbd` | fzf でブランチを選択して削除 |
| ファイル選択 cd | `cdf` | fzf でファイルを選択し、そのディレクトリに移動 |

**fzf 環境変数:**
- `FZF_DEFAULT_COMMAND`: `fd` で隠しファイルも対象、`.git`/`node_modules` 除外
- `FZF_DEFAULT_OPTS`: `--ansi`, reverse レイアウト, rounded ボーダー, 高さ 80%

---

## git 設定

**ファイル:** `git/.gitconfig`

| 設定 | 内容 |
|------|------|
| デフォルトブランチ | `main` |
| push デフォルト | `current`（現在のブランチを同名のリモートへ） |
| `autoSetupRemote` | `true`（初回 push 時に自動でリモートをセットアップ） |
| fetch prune | `true`（リモートに存在しないブランチを自動削除） |
| diff ページャ | `delta`（シンタックスハイライト・サイドバイサイド・行番号表示） |
| merge スタイル | `diff3`（ベースも含めた3方向マージ表示） |

`~/.gitconfig` に `[include] path = ~/.config/git/.gitconfig` を追記して読み込む構成。
個人情報（`[user]`, `[secrets]`）は dotfiles に含めず、`~/.gitconfig` に残す。

---

## sheldon（zsh プラグイン管理）

**ファイル:** `sheldon/.sheldon.toml`, `zsh/.zshrc.d/50-plugins.zsh`

| プラグイン | 読み込み | 機能 |
|------------|----------|------|
| `zsh-syntax-highlighting` | 遅延 | コマンド入力時のシンタックスハイライト |
| `zsh-autosuggestions` | 即時 | 履歴ベースの入力補完サジェスト |
| `zsh-history-substring-search` | 即時 | 入力文字列で履歴をサブストリング検索 |

`romkatv/zsh-defer` による遅延読み込みでシェル起動を高速化。

---

## Nerd Font 対応

**ファイル:** `ghostty/config`, `starship/starship.toml`, `brew/Brewfile`

- **フォント:** `Hack Nerd Font`（`font-hack-nerd-font` cask でインストール）
- **ghostty:** フォントサイズ 16 で Hack Nerd Font を使用

**starship アイコン:**

| モジュール | アイコン |
|------------|---------|
| ディレクトリ（読み取り専用） |  |
| git ブランチ |  |
| Node.js |  |
| Python |  |
| Rust |  |
| Go |  |

**starship time モジュール:** `[HH:MM:SS]` 形式で現在時刻を表示（`$time` を format に追加）

---

## zoxide worktree 対応

**ファイル:** `zsh/.zshrc.d/20-functions.zsh`, `zsh/.zshrc.d/00-path.zsh`

`cd` コマンドを zoxide ラッパーとしてオーバーライドし、git worktree 間のパス変換を自動化。

| コマンド | 動作 |
|----------|------|
| `cd <キーワード>` | zoxide でスマート移動。別 worktree のパスが候補に上がった場合、現在の worktree の対応パスに変換 |
| `cdi` | fzf によるインタラクティブ選択（worktree 変換あり） |

`zoxide init zsh --no-cmd` でデフォルトの `z`/`zi` を生成せず、カスタム `cd` に一本化。

---

## tmux 設定

**ファイル:** `tmux/.tmux.conf`

### プラグイン（TPM 管理）

| プラグイン | 機能 |
|------------|------|
| `tmux-sensible` | tmux のデフォルト設定改善 |
| `tmux-resurrect` | セッションの保存・復元 |
| `tmux-continuum` | セッションの自動保存・起動時自動復元 |
| `tmux-pain-control` | ペイン操作の標準化 |
| `tmux-open` | ファイル/URL をそのまま開く |
| `tmux-fzf-url` | `prefix + x` で画面内 URL を fzf 選択して開く |

### キーバインド

| 操作 | キー |
|------|------|
| 設定リロード | `prefix + r` |
| ウィンドウ切り替え | `Shift + 左/右` |
| ペイン移動 | `prefix + h/j/k/l`（vim-like） |
| 新規ウィンドウ | `prefix + c`（現在ディレクトリで開く） |
| 縦分割 | `prefix + "` |
| 横分割 | `prefix + %` |
| コピー開始 | `v`（コピーモード内） |
| 矩形選択 | `Ctrl+v` |
| ヤンク | `y` または `Enter`（`pbcopy` に連携） |

マウス操作有効、vi モード、ドラッグ選択で自動コピー。

---

## その他

### エイリアス

| エイリアス | コマンド | 説明 |
|------------|----------|------|
| `ls` | `exa --time-style=long-iso -g` | eza によるls |
| `ll` | `exa --git -gl` | git 情報付き詳細表示 |
| `la` | `exa --git -agl` | 隠しファイルも含む詳細表示 |
| `gst` | `git status` | ステータス確認 |
| `ga` | `git add` | ステージング |
| `gc` | `git commit` | コミット |
| `gp` | `git push` | プッシュ |
| `gl` | `git log --oneline` | 1行ログ |
| `gu` | `git reset HEAD~1` | 直前のコミットを取り消し |
| `cdf` | fzf でファイル選択して cd | ディレクトリ移動 |

### インストールツール（Brewfile）

主要追加パッケージ：

- `git-delta` — git diff のシンタックスハイライト・サイドバイサイド表示
- `sheldon` — zsh プラグインマネージャ
- `lsd` — Nerd Font アイコン対応 ls
- `font-hack-nerd-font` — Nerd Font パッチ済みフォント（cask）

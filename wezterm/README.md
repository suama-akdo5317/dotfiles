# WezTerm設定

WezTermのモジュラー設定ファイル

## ディレクトリ構造

```
wezterm/
├── wezterm.lua              # メイン設定ファイル（モジュール読み込み）
└── modules/
    ├── appearance.lua       # 外観設定（テーマ、フォント、透過、タブタイトル）
    ├── behavior.lua         # 動作設定（IME、スクロールバック、起動設定）
    ├── fonts.lua           # (未使用)
    ├── keybinds.lua        # キーバインド設定（ワークスペース管理含む）
    ├── mouse.lua           # マウス操作設定
    └── hyperlinks.lua      # ハイパーリンク設定
```

## 設定ファイル

### wezterm.lua
メイン設定ファイル。`modules/`ディレクトリ内の全`.lua`ファイルを自動的に読み込み、各モジュールの`apply_to_config`関数を実行する

### modules/appearance.lua
- **フォント**: JetBrains Mono (13pt)
- **カラースキーム**: Dracula
- **背景透過**: 0.85
- **タブバー**: 画面下部に配置
- **ペインスタイル**: 非アクティブペインの彩度・明度を調整

### modules/behavior.lua
- IME有効化
- デフォルトディレクトリ: `~`
- スクロールバック: 10000行
- タブバー有効化

### modules/keybinds.lua
カスタムキーバインド、検索機能の設定

### modules/mouse.lua
マウス操作の強化設定
- 右クリックでペースト
- Ctrl+ホイールでタブ切り替え
- Ctrl+Shift+左クリックで垂直分割

### modules/hyperlinks.lua
URLやファイルパスのハイパーリンク設定

## 主要なキーバインド

### タブ操作
- `Ctrl+Shift+T`: 新しいタブを開く
- `Ctrl+Shift+W`: タブを閉じる
- `Ctrl+Tab`: 次のタブへ移動
- `Ctrl+Shift+Tab`: 前のタブへ移動

### ペイン操作
- `Ctrl+Shift+V`: ペインを垂直分割（下に新しいペイン）
- `Ctrl+Shift+H`: ペインを水平分割（右に新しいペイン）
- `Ctrl+Shift+X`: ペインを閉じる
- `Ctrl+Shift+矢印キー`: ペイン間を移動
- `Ctrl+Shift+Z`: ペインのズーム切り替え

### ペインリサイズ
- `Ctrl+Shift+Alt+矢印キー`: ペインのサイズを調整

### コピー＆ペースト
- `Ctrl+Shift+C`: コピー
- `Ctrl+V`: ペースト

### フォントサイズ
- `Ctrl+=`: フォントサイズを大きく
- `Ctrl+-`: フォントサイズを小さく
- `Ctrl+0`: フォントサイズをリセット

### スクロールバック・検索
- `Ctrl+Shift+F`: 検索
- `Ctrl+Shift+Space`: クイックセレクト（URLやパスを素早く選択）

### マウス操作
- **右クリック**: ペースト
- **ミドルクリック**: プライマリセレクションからペースト
- **Ctrl+左クリック**: URLを開く
- **Ctrl+Shift+左クリック**: 垂直分割
- **Ctrl+ホイール上下**: タブ切り替え

### その他
- `Ctrl+Shift+N`: 新しいウィンドウを開く
- `Ctrl+Shift+P`: コマンドパレット
- `F11`: フルスクリーン切り替え
- `Shift+Enter`: 改行コードを送信

## 追加機能

### タブタイトルのカスタマイズ
各タブには以下の情報が表示されます：
- タブ番号
- カレントディレクトリ名
- 実行中のプロセス名（アクティブタブのみ）

例: `1: Projects [vim]`

### ハイパーリンクの認識
以下のパターンを自動的にハイパーリンクとして認識：
- HTTP/HTTPS URL
- ファイルパス（行番号付き: `/path/to/file:123`）
- IPアドレス:ポート番号
- Git commit hash
- GitHub issue番号（#123 形式、要カスタマイズ）

Ctrl+左クリックでリンクを開けます。

### クイックセレクト
`Ctrl+Shift+Space`で以下のパターンを素早く選択：
- URL
- ファイルパス
- IPアドレス
- Git commit hash

### 自動リロード
設定ファイルを変更すると自動的にリロードされます。

## トラブルシューティング

### 設定ファイルが読み込まれない
Weztermは以下の優先順位で設定ファイルを探します：
1. `~/.wezterm.lua`
2. `~/.config/wezterm/wezterm.lua`

`~/.wezterm.lua`が存在する場合、そちらが優先されます。`~/.config/wezterm/`の設定を使用する場合は、`~/.wezterm.lua`を削除してください。

**注意**: シンボリックリンクは不安定なため推奨されません。

### キーバインドが動作しない
1. Weztermを完全に再起動してください（全てのウィンドウを閉じる）
2. デフォルトのキーバインドやmacOSのシステムショートカットと競合していないか確認してください
3. Debug Overlay (`Ctrl+Shift+P` → "Show Debug Overlay") でキーイベントを確認できます

### モジュールが読み込まれない
`wezterm.lua`のログ出力を確認してください。各モジュールの読み込み状況が`wezterm.log_info`で出力されます。

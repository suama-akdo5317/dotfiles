# dotfiles

## Brewfileの管理

インストールしたパッケージは `Brewfile` で管理している。

### 何かインストールしたときのフロー

```bash
# 1. パッケージをインストール
brew install <package>
# or
brew install --cask <cask>

# 2. Brewfileを更新
brew bundle dump --force --file=~/.dotfiles/Brewfile

# 3. 差分を確認して、依存ライブラリ等の不要なものを削除
#    意図して入れたものだけを残し、用途コメントを追加する
cd ~/.dotfiles
git diff Brewfile

# 4. コミット
git add Brewfile
git commit -m "brew: add <package>"
```

### 環境を再現するとき（新しいMacなど）

```bash
brew bundle install --file=~/.dotfiles/Brewfile
```

### 注意点

- `brew bundle dump` は依存ライブラリも出力するため、dump後は差分を確認して不要なものを取り除く
- 新しく追加したパッケージには必ず用途コメントを書く
- 依存ライブラリ（`libpng` 等）はセクション `Dependencies` にまとめて残しておく
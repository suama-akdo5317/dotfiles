# キーバインド設定 - Mac用基本操作
#
# このファイルには基本的なキーバインド設定を定義します
# Peco等の外部ツールに依存するキーバインドは41-keybinds-peco.zshを参照

# Emacsモードを有効化（デフォルトだが明示的に設定）
bindkey -e

# Option+左右矢印で単語単位移動
bindkey '^[[1;3D' backward-word     # Option+左矢印
bindkey '^[[1;3C' forward-word      # Option+右矢印

# 別のパターンも追加（ターミナルによって異なるため）
bindkey '^[b' backward-word         # Alt+B
bindkey '^[f' forward-word          # Alt+F

# 単語削除
bindkey '^W' backward-kill-word     # Ctrl+W（前の単語削除）
bindkey '^[d' kill-word             # Alt+D（次の単語削除）

# Option+Deleteで前の単語削除
bindkey '^[^?' backward-kill-word   # Option+Delete

# 行操作
bindkey '^A' beginning-of-line      # Ctrl+A（行頭）
bindkey '^E' end-of-line            # Ctrl+E（行末）
bindkey '^U' backward-kill-line     # Ctrl+U（行頭まで削除）
bindkey '^K' kill-line              # Ctrl+K（行末まで削除）

# 履歴操作（基本）
bindkey '^P' history-beginning-search-backward  # Ctrl+P
bindkey '^N' history-beginning-search-forward   # Ctrl+N

# 元に戻す
bindkey '^[z' undo                  # Option+Z（推奨）
bindkey '^_' undo                   # Ctrl+_（標準）

# 利用可能なキーバインド一覧:
# - Option+← / Option+→  : 前/次の単語に移動
# - Option+Delete        : 前の単語を削除
# - Ctrl+W               : 前の単語を削除
# - Alt+D                : 次の単語を削除
# - Ctrl+A / Ctrl+E      : 行頭/行末に移動
# - Ctrl+U / Ctrl+K      : 行頭/行末まで削除
# - Ctrl+P / Ctrl+N      : 履歴を前後に移動
# - Option+Z / Ctrl+_    : 元に戻す

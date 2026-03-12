  -- 外観関連の設定
local wezterm = require 'wezterm'

local M = {}

function M.apply_to_config(config)
  config.font = wezterm.font("JetBrains Mono")
  config.color_scheme = "Dracula"

  -- フォントサイズ
  config.font_size = 13.0

  -- 背景透過
  config.window_background_opacity = 0.85

  -- ペインの見た目の設定
  -- アクティブなペインの境界線を目立たせる
  config.inactive_pane_hsb = {
    saturation = 0.8,
    brightness = 0.3,
  }

  -- ペインボーダーの色設定（Draculaテーマに合わせた色）
  config.pane_select_fg_color = "#bd93f9"  -- Draculaの紫
  config.pane_select_bg_color = "#44475a"  -- Draculaの選択背景色

  -- ペイン間の余白設定
  config.window_padding = {
    left = 4,
    right = 4,
    top = 4,
    bottom = 4,
  }

  -- タブバーの設定
  config.use_fancy_tab_bar = true
  config.tab_bar_at_bottom = true

  -- ペインの境界線を太くする
  config.window_frame = {
    border_thickness = 2,
    -- Draculaテーマに合わせたタイトルバーの色
    active_titlebar_bg = "#282a36",    -- Draculaの背景色
    inactive_titlebar_bg = "#1e1f29",  -- より暗い背景色
  }

  -- ウィンドウタイトルをカスタマイズ
  config.window_title = "WezTerm"
end

-- タブタイトルのカスタマイズ
wezterm.on('format-tab-title', function(tab, tabs, panes, config, hover, max_width)
  local pane = tab.active_pane
  local cwd = pane.current_working_dir
  local title = tab.active_pane.title

  -- カレントディレクトリのbasename取得
  local dir = "~"
  if cwd then
    local uri = cwd
    if type(uri) == "userdata" then
      uri = uri.file_path
    end
    dir = uri:match("([^/]+)/?$") or "~"
  end

  -- プロセス名を取得
  local process = pane.foreground_process_name
  if process then
    process = process:match("([^/]+)$") or process
  else
    process = "shell"
  end

  -- タブインデックス
  local index = tab.tab_index + 1

  -- アクティブタブとそうでないタブで表示を変える
  if tab.is_active then
    return {
      {Text = ' ' .. index .. ': ' .. dir .. ' [' .. process .. '] '},
    }
  else
    return {
      {Text = ' ' .. index .. ': ' .. dir .. ' '},
    }
  end
end)

return M
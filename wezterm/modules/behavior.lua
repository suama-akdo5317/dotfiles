--------------- Weztermの動作に関する設定 ---------------

local wezterm = require 'wezterm'

local M = {}

function M.apply_to_config(config)
  -- マルチプレクサ機能の設定
  config.use_ime = true
  config.default_cwd = "~"
  config.enable_tab_bar = true
  config.use_fancy_tab_bar = false
  config.exit_behavior = "Close"

  -- スクロールバックの行数を設定 (ターミナル内でさかのぼって表示できる行数が10000行に設定)
  config.scrollback_lines = 10000

  -- タブバーを有効化 (複数のタブを開いた際にタブバーが表示される)
  config.enable_tab_bar = true

  -- 起動時の設定
  config.automatically_reload_config = true

  -- ビジュアルベルを無効化
  config.audible_bell = "Disabled"
  config.visual_bell = {
    fade_in_function = 'EaseIn',
    fade_in_duration_ms = 150,
    fade_out_function = 'EaseOut',
    fade_out_duration_ms = 150,
  }

  -- スクロール動作
  config.alternate_buffer_wheel_scroll_speed = 3

  -- コピーモードの設定
  config.quick_select_patterns = {
    -- URLパターン
    'https?://\\S+',
    -- ファイルパス
    '/[^\\s:]+',
    -- IPアドレス
    '\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}',
    -- Git commit hash
    '[0-9a-f]{7,40}',
  }
end

return M
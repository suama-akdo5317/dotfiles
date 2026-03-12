--------------- マウス操作に関する設定 ---------------

local wezterm = require 'wezterm'

local M = {}

function M.apply_to_config(config)
  -- マウスバインディング
  config.mouse_bindings = {
    -- 右クリックでペースト
    {
      event = {Down = {streak = 1, button = 'Right'}},
      mods = 'NONE',
      action = wezterm.action.PasteFrom('Clipboard'),
    },

    -- Ctrl+左クリックでURLを開く
    {
      event = {Up = {streak = 1, button = 'Left'}},
      mods = 'CTRL',
      action = wezterm.action.OpenLinkAtMouseCursor,
    },

    -- Ctrl+Shift+左クリックで垂直分割
    {
      event = {Down = {streak = 1, button = 'Left'}},
      mods = 'CTRL|SHIFT',
      action = wezterm.action.SplitVertical{domain='CurrentPaneDomain'},
    },

    -- ミドルクリックでペースト
    {
      event = {Down = {streak = 1, button = 'Middle'}},
      mods = 'NONE',
      action = wezterm.action.PasteFrom('PrimarySelection'),
    },

    -- ホイールでタブ切り替え（Ctrl+ホイール）
    {
      event = {Down = {streak = 1, button = {WheelUp = 1}}},
      mods = 'CTRL',
      action = wezterm.action.ActivateTabRelative(-1),
    },
    {
      event = {Down = {streak = 1, button = {WheelDown = 1}}},
      mods = 'CTRL',
      action = wezterm.action.ActivateTabRelative(1),
    },
  }
end

return M

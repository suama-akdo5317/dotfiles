--------------- キーバインドに関する設定 ---------------

local wezterm = require 'wezterm'

local module = {}

function module.apply_to_config(config)
    config.keys = {
        -- 新しいタブを開く
        {key="t", mods="CTRL|SHIFT", action=wezterm.action{SpawnTab="DefaultDomain"}},
        -- タブを閉じる
        {key="w", mods="CTRL|SHIFT", action=wezterm.action{CloseCurrentTab={confirm=true}}},

        -- ペインを垂直分割
        {key="v", mods="CTRL|SHIFT", action=wezterm.action{SplitVertical={domain="CurrentPaneDomain"}}},
        -- ペインを水平分割
        {key="h", mods="CTRL|SHIFT", action=wezterm.action{SplitHorizontal={domain="CurrentPaneDomain"}}},

        -- ペインを閉じる（確認付き）
        {key="x", mods="CTRL|SHIFT", action=wezterm.action{CloseCurrentPane={confirm=true}}},

        -- ペイン間を移動
        {key="LeftArrow", mods="CTRL|SHIFT", action=wezterm.action{ActivatePaneDirection="Left"}},
        {key="RightArrow", mods="CTRL|SHIFT", action=wezterm.action{ActivatePaneDirection="Right"}},
        {key="UpArrow", mods="CTRL|SHIFT", action=wezterm.action{ActivatePaneDirection="Up"}},
        {key="DownArrow", mods="CTRL|SHIFT", action=wezterm.action{ActivatePaneDirection="Down"}},

        -- ペインのズームトグル
        {key="z", mods="CTRL|SHIFT", action="TogglePaneZoomState"},

        -- タブ間の移動
        {key="Tab", mods="CTRL", action=wezterm.action{ActivateTabRelative=1}},
        {key="Tab", mods="CTRL|SHIFT", action=wezterm.action{ActivateTabRelative=-1}},

        -- フォントサイズの変更
        {key="=", mods="CTRL", action=wezterm.action.IncreaseFontSize},
        {key="-", mods="CTRL", action=wezterm.action.DecreaseFontSize},
        {key="0", mods="CTRL", action=wezterm.action.ResetFontSize},

        -- クリップボードの内容をペースト
        {key="v", mods="CTRL", action=wezterm.action.PasteFrom("Clipboard")},

        -- ペインのリサイズ
        {key="LeftArrow", mods="CTRL|SHIFT|ALT", action=wezterm.action{AdjustPaneSize={"Left", 1}}},
        {key="RightArrow", mods="CTRL|SHIFT|ALT", action=wezterm.action{AdjustPaneSize={"Right", 1}}},
        {key="UpArrow", mods="CTRL|SHIFT|ALT", action=wezterm.action{AdjustPaneSize={"Up", 1}}},
        {key="DownArrow", mods="CTRL|SHIFT|ALT", action=wezterm.action{AdjustPaneSize={"Down", 1}}},

        -- 新しいウィンドウを開く
        {key="n", mods="CTRL|SHIFT", action=wezterm.action.SpawnWindow},

        -- フルスクリーンの切り替え
        {key="F11", mods="", action=wezterm.action.ToggleFullScreen},

        -- Shift+Enterで改行コードを送信
        {key="Enter", mods="SHIFT", action=wezterm.action.SendString("\x1b\r")},

        -- 検索機能の強化
        {key="f", mods="CTRL|SHIFT", action=wezterm.action.Search{CaseSensitiveString=""}},

        -- クイックセレクトモード（URLやファイルパスを素早く選択）
        {key="Space", mods="CTRL|SHIFT", action=wezterm.action.QuickSelect},

        -- コマンドパレット
        {key="p", mods="CTRL|SHIFT", action=wezterm.action.ActivateCommandPalette},
    }
end

return module
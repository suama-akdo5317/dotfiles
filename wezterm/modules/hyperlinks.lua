--------------- ハイパーリンクに関する設定 ---------------

local wezterm = require 'wezterm'

local M = {}

function M.apply_to_config(config)
  -- ハイパーリンクのルール
  config.hyperlink_rules = wezterm.default_hyperlink_rules()

  -- ファイルパスをハイパーリンクとして認識（/path/to/file:行番号）
  table.insert(config.hyperlink_rules, {
    regex = [[\b\w+://[^\s]+\b]],
    format = '$0',
  })

  -- GitHubのissue/PR番号を認識 (#123)
  table.insert(config.hyperlink_rules, {
    regex = [[\b#(\d+)\b]],
    format = 'https://github.com/your-org/your-repo/issues/$1',
  })

  -- ローカルファイルパスを認識
  table.insert(config.hyperlink_rules, {
    regex = [[/[^\s:]+:\d+]],
    format = '$0',
  })

  -- IPアドレス:ポート番号を認識
  table.insert(config.hyperlink_rules, {
    regex = [[\b\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}:\d+\b]],
    format = 'http://$0',
  })
end

return M

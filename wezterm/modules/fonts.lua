local wezterm = require 'wezterm'

local M = {}

function M.apply_to_config(config)
  config.font = wezterm.font('Hack Nerd Font')
  config.font_size = 16.0
end

return M

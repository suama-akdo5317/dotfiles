local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- デバッグモードを有効にする
config.debug_key_events = true

-- 設定ファイルが格納されているディレクトリのパスを取得
local config_dir = wezterm.config_dir
local config_modules_dir = config_dir .. '/modules'

wezterm.log_info("Config directory: " .. config_dir)
wezterm.log_info("Modules directory: " .. config_modules_dir)

-- 各設定ファイルを読み込み、設定を適用
local function load_config_files(dir)
  local loaded_files = {}
  for _, file in ipairs(wezterm.glob(dir .. '/*.lua')) do
    local module_name = file:match("([^/]+)%.lua$")
    wezterm.log_info("Attempting to load: " .. file)

    local status, module = pcall(function()
      return dofile(file)
    end)

    if status then
      if type(module) == 'table' and type(module.apply_to_config) == 'function' then
        local apply_status, apply_error = pcall(function()
          module.apply_to_config(config)
        end)
        if apply_status then
          table.insert(loaded_files, module_name)
          wezterm.log_info("Successfully loaded and applied: " .. module_name)
        else
          wezterm.log_error("Error applying config from " .. module_name .. ": " .. tostring(apply_error))
        end
      else
        wezterm.log_warn("Module " .. module_name .. " does not have a valid apply_to_config function")
      end
    else
      wezterm.log_error("Failed to load config file: " .. file .. ". Error: " .. tostring(module))
    end
  end

  return loaded_files
end

-- 設定モジュールを読み込む
local loaded_modules = load_config_files(config_modules_dir)

-- デバッグ情報の出力
if #loaded_modules > 0 then
  wezterm.log_info('Loaded config modules: ' .. table.concat(loaded_modules, ', '))
else
  wezterm.log_warn('No config modules were loaded')
end

return config
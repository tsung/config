--
local wezterm = require 'wezterm'

local act = wezterm.action
local config = wezterm.config_builder()

config.check_for_updates = false
config.color_scheme = 'Tango (terminal.sexy)'
-- config.font = wezterm.font_with_fallback({'Cousine', 'Noto Color Emoji', 'Noto Sans CJK JP'})
config.font_size = 12.0
config.hide_mouse_cursor_when_typing = false
-- config.initial_cols = 132
-- config.initial_rows = 43
-- config.line_height = 1.0
config.window_padding = {
    bottom = 0,
    left = 0,
    right = 0,
    top = 0,
}

-- https://wezterm.org/config/lua/keyassignment/ActivateTab.html
config.keys = {}
for i = 1, 8 do
    table.insert(config.keys, {
        key = tostring(i),
        mods = 'ALT',
        action = act.ActivateTab(i - 1),
    })
end

wezterm.on('format-window-title', function(tab, pane, tabes, panes, config)
    return 'WezTerm ' .. wezterm.version
end)

return config

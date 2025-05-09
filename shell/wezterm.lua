--
local wezterm = require 'wezterm'

local act = wezterm.action
local config = wezterm.config_builder()

config.window_padding = {
    bottom = 0,
    left = 0,
    right = 0,
    top = 0,
}

config.check_for_updates = false
config.color_scheme = 'Tango (terminal.sexy)'
-- config.font = wezterm.font_with_fallback({'Maple Mono NF CN', 'Cousine', 'Noto Color Emoji', 'Noto Sans CJK JP'})
config.font_size = 12.0
config.hide_mouse_cursor_when_typing = false
-- config.initial_cols = 132
-- config.initial_rows = 43
-- config.line_height = 1.0

-- 滑鼠點擊 URL 不要開瀏覽器
config.mouse_bindings = {
    -- Disable the default click behavior
    {
      event = { Up = { streak = 1, button = "Left"} },
      mods = "NONE",
      action = wezterm.action.DisableDefaultAssignment, -- You may want a different option here. See /u/Brian's comment below
    },
    -- Ctrl-click will open the link under the mouse cursor
    {
        event = { Up = { streak = 1, button = "Left" } },
        mods = "CTRL",
        action = wezterm.action.OpenLinkAtMouseCursor,
    },
    -- Disable the Ctrl-click down event to stop programs from seeing it when a URL is clicked
    {
        event = { Down = { streak = 1, button = "Left" } },
        mods = "CTRL",
        action = wezterm.action.Nop,
    }
}
-- action = wezterm.action.CompleteSelection 'ClipboardAndPrimarySelection'

-- 滑鼠選取 自動複製到剪貼簿
config.mouse_bindings = {
  -- 左鍵滑鼠選取後自動複製到 Clipboard
  {
    event = { Up = { streak = 1, button = 'Left' } },
    mods = 'NONE',
    action = act.CompleteSelectionOrOpenLinkAtMouseCursor 'ClipboardAndPrimarySelection',
  },
  -- 右鍵點擊：如果有選取文字則複製，否則貼上
  {
    event = { Down = { streak = 1, button = 'Right' } },
    mods = 'NONE',
    action = wezterm.action_callback(function(window, pane)
      local has_selection = window:get_selection_text_for_pane(pane) ~= ''
      if has_selection then
        window:perform_action(act.CopyTo 'ClipboardAndPrimarySelection', pane)
        window:perform_action(act.ClearSelection, pane)
      else
        window:perform_action(act.PasteFrom 'Clipboard', pane)
      end
    end),
  },
}

-- ALT + 1~8 activate that tab
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

-- status bar
wezterm.on('update-right-status', function(window, pane)
    -- 取得時間
    local date = wezterm.strftime('%Y-%m-%d %H:%M:%S')

    -- 取得 git branch
    local cwd_uri = pane:get_current_working_dir()
    local branch = ""
    if cwd_uri then
        local cwd = cwd_uri.file_path
        local git_head_file = io.open(cwd .. "/.git/HEAD", "r")
        if git_head_file then
            local head = git_head_file:read("*line")
            git_head_file:close()
            local match = head:match("ref: refs/heads/(.+)")
            if match then
            branch = match
            end
        end
    end

    -- 取得目前指令
    local cmd = pane:get_foreground_process_name()
    local simple_cmd = cmd and cmd:match("^.+/(.+)$") or ""

    -- 取得記憶體使用狀況（Linux only）
    local mem = ""
    local handle = io.popen("free -m | awk '/Mem:/ {printf \"%.2f Gi / %.2f Gi\", $3/1024, $2/1024}'")
    if handle then
        mem = handle:read("*a")
        handle:close()
    end

    window:set_right_status(wezterm.format {
        { Text = string.format(" %s | %s | %s | %s", branch, simple_cmd, mem, date) },
    })
end)

return config

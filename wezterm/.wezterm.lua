local wezterm = require 'wezterm'
local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end


-- Функция для добавления пробелов по бокам текста вкладки
wezterm.on('format-tab-title', function(tab, tabs, panes, config, hover, max_width)
  local title = tab.active_pane.title
  -- Добавляем по 4 пробела с каждой стороны, чтобы вкладка стала шире
  return {
    { Text = '' .. title .. '        ' },
  }
end)

-- Отключает звуковой сигнал
config.audible_bell = "Disabled"

-- =========================
-- FONT (как в Alacritty)
-- =========================

config.font = wezterm.font(
  'FiraCode Nerd Font Mono',
  {
    weight = 'Regular',
    stretch = 'Normal',
    style = 'Normal',
  }
)

config.font_size = 12

-- Отключаем лигатуры
config.harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }
-- config.harfbuzz_features = { 'calt=1', 'clig=1', 'liga=1' }

config.line_height = 1  -- Adjust line spacing

-- =========================
-- DISABLE CLOSE PROMPT
-- =========================

config.window_close_confirmation = 'NeverPrompt'

-- =========================
-- WINDOW
-- =========================

config.win32_system_backdrop = 'Acrylic'

config.initial_cols = 120
config.initial_rows = 35

config.window_padding = {
  left = 5,
  right = 5,
  top = 5,
  bottom = 5,
}

config.window_background_opacity = 0.97
config.text_background_opacity = 1.0

config.window_decorations = "TITLE | RESIZE"

config.tab_max_width = 40

config.use_fancy_tab_bar = true
config.tab_bar_at_bottom = false

config.colors = {
  tab_bar = {
    background = "#22272e",

    active_tab = {
      bg_color = "#2d333b",
      fg_color = "#c9d1d9",
      intensity = "Bold",
    },

    inactive_tab = {
      bg_color = "#22272e",
      fg_color = "#768390",
    },

    inactive_tab_hover = {
      bg_color = "#2d333b",
      fg_color = "#c9d1d9",
    },

    new_tab = {
      bg_color = "#22272e",
      fg_color = "#768390",
    },

    new_tab_hover = {
      bg_color = "#2d333b",
      fg_color = "#c9d1d9",
    },
  },
}

-- =========================
-- COLORS (почти 1:1 как Alacritty github_dark)
-- =========================

config.colors = {
  foreground = "#c9d1d9",
  background = "#22272e", 

  cursor_bg = "#c9d1d9",
  cursor_fg = "#2d333b",
  cursor_border = "#c9d1d9",

  selection_bg = "#3f4752", -- темнее и холоднее
  selection_fg = "#ffffff",


  ansi = {
    "#545d68", -- black
    "#f47067", -- red
    "#66D665", -- green
    "#F6B650", -- yellow
    "#6cb6ff", -- blue
    "#dcbdfb", -- magenta
    "#96d0ff", -- cyan
    "#c9d1d9", -- white
  },

  brights = {
    "#768390",
    "#ff938a",
    "#b4f1b4",
    "#f9c784",
    "#8cc2ff",
    "#e6ccff",
    "#b3e5ff",
    "#ffffff",
  },
}

-- =========================
-- KEYS
-- =========================

config.keys = {
  -- Paste
  {
    key = 'v',
    mods = 'CTRL',
    action = wezterm.action.PasteFrom 'Clipboard',
  },

  -- New tab
  {
    key = 't',
    mods = 'CTRL',
    action = wezterm.action.SpawnTab 'CurrentPaneDomain',
  },

  -- Close tab
  {
    key = 'w',
    mods = 'CTRL',
    action = wezterm.action.CloseCurrentTab { confirm = false },
  },
}

-- =========================
-- SCROLL
-- =========================

config.scrollback_lines = 10000

-- =========================
-- WSL
-- =========================

config.default_prog = {
  'C:\\Windows\\System32\\wsl.exe',
  '--cd',
  '~',
}

return config

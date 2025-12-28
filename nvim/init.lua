-- Номера строк
vim.opt.number = true

-- Относительные номера строк (удобно для навигации)
vim.opt.relativenumber = true

-- Подсвечивает текущую строку
vim.opt.cursorline = true

-- Отступы: 4 пробела, умные отступы
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Поиск: игнорировать регистр, если все буквы строчные
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true -- подсвечивать найденное
vim.opt.incsearch = true -- искать по мере ввода

-- Не создавать резервные файлы (swap, backup)
vim.opt.swapfile = false
vim.opt.backup = false
-- Но используем более современную систему отмен (undo), которая хранит историю в файле
vim.opt.undodir = os.getenv("HOME") .. "/.config/nvim/undodir"
vim.opt.undofile = true

-- Позволяет скрывать буфер (файл), вместо того чтобы его закрывать, даже если в нем есть несохраненные изменения
vim.opt.hidden = true

-- Улучшенная работа с системным буфером обмена
vim.opt.clipboard = 'unnamedplus'

-- Автодополнение командной строки
vim.opt.wildmenu = true

-- Показывать незавершенные команды в статусной строке
vim.opt.showcmd = true


vim.cmd[[
  augroup LualineAutoLoad
    autocmd!
    autocmd VimEnter * lua load_lualine()
  augroup END
]]

function load_lualine()
  -- Add plugin paths to package path
  local plugin_path = vim.fn.expand('~/.config/nvim/lua/plugins/')

  
  -- Load nvim-web-devicons
  package.path = package.path .. ';' .. plugin_path .. 'nvim-web-devicons/?.lua'
  package.path = package.path .. ';' .. plugin_path .. 'nvim-web-devicons/lua/?.lua'
  require('nvim-web-devicons').setup()
  
  -- Load lualine
  package.path = package.path .. ';' .. plugin_path .. 'lualine/?.lua'
  package.path = package.path .. ';' .. plugin_path .. 'lualine/lua/?.lua'
  

  require('lualine').setup({
    options = {
      theme = 'auto',
      icons_enabled = true,
      component_separators = '|',
      section_separators = '',
    },

  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  })
end

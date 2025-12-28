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

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- fat cursor
vim.opt.guicursor = ''

-- Make line numbers default
-- vim.wo.number = true
vim.opt.nu = true
vim.opt.relativenumber = true

-- Enable mouse mode
-- vim.opt.mouse = 'a'

-- tabs
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- vim.opt.autoindent = true
-- vim.opt.breakindent = true
vim.opt.smartindent = true

vim.opt.wrap = false

-- Set highlight on search
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

-- Save undo history
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.wo.scrolloff = 0 -- 10
vim.wo.signcolumn = 'yes'
vim.opt.isfname:append("@-@")

-- Decrease update time
vim.o.updatetime = 50
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
-- vim.opt.completeopt = 'menuone,noselect'

-- Show character column
vim.opt.colorcolumn = '80'

-- Open netrw by default
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_win_size = 25

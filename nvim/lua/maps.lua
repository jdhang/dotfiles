vim.keymap.set({ 'n', 'v' }, '<space>', '<nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- theprimeagen remaps
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

vim.keymap.set('n', 'J', 'mzJ`z')
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- greatest remap ever
vim.keymap.set('x', '<leader>p', [["_dP]])

vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]])
vim.keymap.set('n', '<leader>Y', [["+Y]])

vim.keymap.set({ 'n', 'v' }, '<leader>d', [["_d]])

vim.keymap.set('n', 'Q', '<nop>')
vim.keymap.set('n', '<C-f>', '<cmd>silent !tmux neww tmux-sessionizer<CR>')

-- format
vim.keymap.set('n', '<leader>f', vim.lsp.buf.format, { desc = '[F]ormat file' })
-- vim.keymap.set('n', '<leader>ff', '<cmd>silent %!prettierd --stdin-filepath %<CR>')
-- vim.keymap.set('n', '<leader>fw', '<cmd>silent %!prettierd --stdin-filepath %<CR><cmd>write<CR>', { desc = '[F]ormat and [W]rite file' })
vim.keymap.set('n', '<leader>fw', '<cmd>EslintFixAll<CR><cmd>write<CR>', { desc = '[F]ormat and [W]rite file' })

-- don't yank on x
vim.keymap.set('n', 'x', '"_x')

-- tabedit
vim.keymap.set('n', 'te', ':tabedit', { desc = '[T]ab [E]dit' })

-- split window
vim.keymap.set('n', 'ss', ':split<CR><C-w>w')
vim.keymap.set('n', 'sv', ':vsplit<CR><C-w>w')

-- buffer delete
vim.keymap.set('n', 'bd', ':bd<CR>')

-- close window
vim.keymap.set('n', 'cw', ':close<CR>')

-- delete word backwards
vim.keymap.set('n', 'dw', 'vb"_d')

-- select all
vim.keymap.set('n', '<C-a>', 'gg<S-v>G')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

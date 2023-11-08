vim.keymap.set({ 'n', 'v' }, '<space>', '<nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- theprimeagen remaps
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv") -- move highlighted text up
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv") -- move highlighted text down

vim.keymap.set('n', 'J', 'mzJ`z')            -- move below line to current line
vim.keymap.set('n', '<C-d>', '<C-d>zz')      -- center page down
vim.keymap.set('n', '<C-u>', '<C-u>zz')      -- center page up
vim.keymap.set('n', 'n', 'nzzzv')            -- center forwards search
vim.keymap.set('n', 'N', 'Nzzzv')            -- center backwards search

-- greatest remap ever
vim.keymap.set('x', '<leader>p', [["_dP]])

vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]])
vim.keymap.set('n', '<leader>Y', [["+Y]])

vim.keymap.set({ 'n', 'v' }, '<leader>d', [["_d]])

-- disable
vim.keymap.set('n', 'q:', '<nop>')
vim.keymap.set('n', 'Q', '<nop>')

vim.keymap.set('n', '<C-f>', '<cmd>silent !tmux neww tmux-sessionizer<CR>')

-- format
vim.keymap.set('n', '<leader>f', vim.lsp.buf.format, { desc = '[F]ormat file' })
-- vim.keymap.set('n', '<leader>fw', '<cmd>EslintFixAll<CR><cmd>write<CR>', { desc = '[F]ormat and [W]rite file' })

-- don't yank on x
vim.keymap.set('n', 'x', '"_x')

-- tabedit
vim.keymap.set('n', 'te', ':tabedit', { desc = '[T]ab [E]dit' })

-- split window
vim.keymap.set('n', 'ss', ':split<CR><C-w>w')
vim.keymap.set('n', 'sv', ':vsplit<CR><C-w>w')
vim.keymap.set('n', '<leader>w=', '<C-w>=')

-- quick move to window
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')

-- buffer delete
vim.keymap.set('n', '<leader>bd', ':bd<CR>')
vim.keymap.set('n', '<leader>bD', ':bd!<CR>')

-- buffer movement
vim.keymap.set('n', "[b", "<cmd>bprevious<CR>", { silent = true })
vim.keymap.set('n', "]b", "<cmd>bnext<CR>", { silent = true })
vim.keymap.set('n', "[B", "<cmd>bfirst<CR>", { silent = true })
vim.keymap.set('n', "]B", "<cmd>blast<CR>", { silent = true })

-- write hotkey
vim.keymap.set('n', '<leader>w', '<cmd>w<CR>')
vim.keymap.set('n', '<C-s>', '<cmd>w<CR>')

-- close window
vim.keymap.set('n', '<leader>c', '<cmd>close<CR>')

-- close panel hotkey
vim.keymap.set('n', '<leader>wq', '<cmd>wq<CR>')

-- delete word backwards
vim.keymap.set('n', 'dw', 'vb"_d')

-- select all
vim.keymap.set('n', '<C-A>', 'gg<S-v>G')

-- Diagnostic keymaps
-- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
-- vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
-- vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
-- vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

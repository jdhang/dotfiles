-- ThePrimeagen remaps
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

vim.keymap.set('v', 'J', ":m '>+1<cr>gv=gv") -- move highlighted text up
vim.keymap.set('v', 'K', ":m '<-2<cr>gv=gv") -- move highlighted text down

vim.keymap.set('n', 'J', 'mzJ`z')            -- move below line to current line
vim.keymap.set('n', 'n', 'nzzzv')            -- center forwards search
vim.keymap.set('n', 'N', 'Nzzzv')            -- center backwards search
-- vim.keymap.set('n', '<C-y>', '<C-d>zz')      -- center page down
-- vim.keymap.set('n', '<C-u>', '<C-u>zz')      -- center page up

-- greatest remap ever
vim.keymap.set('x', '<leader>p', [["_dP]])

vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]])
vim.keymap.set('n', '<leader>Y', [["+Y]])

vim.keymap.set({ 'n', 'v' }, '<leader>d', [["_d]])

-- disable
vim.keymap.set('n', 'q:', '<nop>')
vim.keymap.set('n', 'Q', '<nop>')

-- vim.keymap.set('n', '<C-f>', '<cmd>silent !tmux neww tmux-sessionizer<cr>')

-- format
-- vim.keymap.set('n', '<leader>f', vim.lsp.buf.format, { desc = '[F]ormat file' })
-- vim.keymap.set('n', '<leader>fw', '<cmd>EslintFixAll<cr><cmd>write<CR>', { desc = '[F]ormat and [W]rite file' })

-- vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
-- vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
-- vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
-- vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- vim.keymap.set(
--   "n",
--   "<leader>ee",
--   "oif err != nil {<CR>}<Esc>Oreturn err<Esc>"
-- )

-- END ThePrimeagen remaps

-- MORE CUSTOM MAPPINGS

-- vim.keymap.set({ 'n', 'v' }, '<space>', '<nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- don't yank on x
vim.keymap.set('n', 'x', '"_x')

-- tabedit
-- vim.keymap.set('n', 'te', ':tabedit', { desc = '[T]ab [E]dit' })

-- split window
vim.keymap.set('n', '<leader>b', ':split<cr><C-w>w')
vim.keymap.set('n', '<leader>v', ':vsplit<cr><C-w>w')
-- vim.keymap.set('n', '<leader>w=', '<C-w>=')

-- quick move to window
vim.keymap.set('n', '<leader>ww', '<C-w>w')
-- vim.keymap.set('n', '<C-h>', '<C-w>h')
-- vim.keymap.set('n', '<C-j>', '<C-w>j')
-- vim.keymap.set('n', '<C-k>', '<C-w>k')
-- vim.keymap.set('n', '<C-l>', '<C-w>l')

-- buffer delete
vim.keymap.set('n', '<leader>bd', ':bd<cr>')
vim.keymap.set('n', '<leader>bD', ':bd!<cr>')

-- buffer movement
-- vim.keymap.set('n', "<S-h>", "<cmd>bprevious<cr>", { silent = true })
-- vim.keymap.set('n', "<S-l>", "<cmd>bnext<cr>", { silent = true })
-- vim.keymap.set('n', "[b", "<cmd>bprevious<cr>", { silent = true })
-- vim.keymap.set('n', "]b", "<cmd>bnext<cr>", { silent = true })
-- vim.keymap.set('n', "[B", "<cmd>bfirst<cr>", { silent = true })
-- vim.keymap.set('n', "]B", "<cmd>blast<cr>", { silent = true })
-- vim.keymap.set('n', "<leader>bb", "<cmd>e #<cr>", { silent = true })

-- quickfix movement
-- vim.keymap.set('n', '<leader>c', '<cmd>cc<cr>', { silent = true })
vim.keymap.set('n', '<leader>q', '<cmd>botright copen<cr>', { silent = true })
vim.keymap.set('n', '<leader>Q', '<cmd>cclose<cr>', { silent = true })
vim.keymap.set('n', "<C-b>", "<cmd>cnext<cr>", { silent = true })
vim.keymap.set('n', "<C-v>", "<cmd>cprev<cr>", { silent = true })

-- write hotkey
-- vim.keymap.set('n', '<leader>w', '<cmd>w<cr>')
vim.keymap.set({ 'i', 'x', 'n', 's' }, '<C-s>', '<cmd>w<cr><esc>', { desc = 'Save file' })

-- close panel hotkey
-- vim.keymap.set('n', '<leader>wq', '<cmd>wq<cr>')

-- close window
-- vim.keymap.set('n', '<leader>c', '<cmd>close<cr>')

-- delete word backwards
vim.keymap.set('n', 'dw', 'vb"_d')

-- select all
vim.keymap.set('n', '<C-a>', 'gg<S-v>G')

-- better indenting
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- lua execution
vim.keymap.set("n", "<leader>x", "<cmd>.lua<CR>", { desc = "Execute the current line" })
vim.keymap.set("n", "<leader><leader>x", "<cmd>source %<CR>", { desc = "Execute the current file" })

-- Diagnostic keymaps
-- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
-- vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
-- vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
-- vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

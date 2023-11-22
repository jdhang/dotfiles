-- local rose_pine_ok = pcall(require, 'rose-pine')
--
-- if not rose_pine_ok then
--   print('rose-pine was not installed!')
--   return
-- end

-- require('rose-pine').setup({
--   disable_background = true,
-- })

vim.cmd.colorscheme('rose-pine')
-- vim.cmd.colorscheme('catppuccin-mocha')

-- vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
-- vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })

vim.keymap.set('n', '<leader>cc', '<cmd>colorscheme catppuccin-mocha<CR>',
  { desc = 'set [c]olorscheme: [c]atppuccin-mocha' })
vim.keymap.set('n', '<leader>cr', '<cmd>colorscheme rose-pine<CR>',
  { desc = 'set [c]olorscheme: [r]ose-pine' })
vim.keymap.set('n', '<leader>ct', '<cmd>colorscheme tokyonight-night<CR>',
  { desc = 'set [c]olorscheme: [t]okyonight-night' })
vim.keymap.set('n', '<leader>ck', '<cmd>colorscheme kanagawa<CR>',
  { desc = 'set [c]olorscheme: [k]anagawa' })
vim.keymap.set('n', '<leader>co', '<cmd>colorscheme solarized-osaka<CR>',
  { desc = 'set [c]olorscheme: solarized-[o]saka' })

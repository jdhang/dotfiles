-- vim.cmd.colorscheme('rose-pine')
vim.cmd.colorscheme('rose-pine-moon')
-- vim.cmd.colorscheme('tokyonight-night')
-- vim.cmd.colorscheme('tokyonight-storm')
-- vim.cmd.colorscheme('catppuccin-mocha')
-- vim.cmd.colorscheme('catppuccin')
-- vim.cmd.colorscheme('kanagawa-dragon')
-- vim.cmd.colorscheme('oxocarbon')
-- vim.cmd.colorscheme('carbonfox')
-- vim.cmd.colorscheme('ashen')

vim.opt.background = 'dark'

vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
vim.api.nvim_set_hl(0, 'NormalNC', { bg = 'none' })
vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
vim.api.nvim_set_hl(0, 'LineNr', { bg = 'none' })

vim.keymap.set('n', '<leader>cc', '<cmd>colorscheme catppuccin-mocha<CR>',
  { desc = 'set [c]olorscheme: [c]atppuccin-mocha' })
vim.keymap.set('n', '<leader>cr', '<cmd>colorscheme rose-pine<CR>',
  { desc = 'set [c]olorscheme: [r]ose-pine' })
vim.keymap.set('n', '<leader>cm', '<cmd>colorscheme rose-pine-moon<CR>',
  { desc = 'set [c]olorscheme: rose-pine-[m]oon' })
vim.keymap.set('n', '<leader>ct', '<cmd>colorscheme tokyonight-night<CR>',
  { desc = 'set [c]olorscheme: [t]okyonight-night' })
vim.keymap.set('n', '<leader>ck', '<cmd>colorscheme kanagawa<CR>',
  { desc = 'set [c]olorscheme: [k]anagawa' })
vim.keymap.set('n', '<leader>co', '<cmd>colorscheme oxocarbon<CR>',
  { desc = 'set [c]olorscheme: [o]xocarbon' })

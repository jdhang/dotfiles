local flash_ok = pcall(require, 'flash')

if not flash_ok then
  print('flash.nvim is not installed!')
  return
end

vim.keymap.set({ 'n', 'x', 'o' }, 's', function() require('flash').jump() end, { desc = 'Flash' })
vim.keymap.set({ 'n', 'x', 'o' }, 'S', function() require('flash').treesitter_search() end, { desc = 'Flash Treesitter' })
vim.keymap.set('o', 'R', function() require('flash').remote() end, { desc = 'Remote Flash' })
vim.keymap.set({ 'x', 'o' }, 'R', function() require('flash').treesitter_search() end, { desc = 'Treesitter Search' })
vim.keymap.set('c', '<C-s>', function() require('flash').toggle() end, { desc = 'Toggle Flash Search' })

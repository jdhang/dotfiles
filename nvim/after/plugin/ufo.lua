vim.o.foldcolumn = '1' -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
vim.keymap.set('n', 'zr', require('ufo').openFoldsExceptKinds)
vim.keymap.set('n', 'zm', require('ufo').closeFoldsWith) -- closeAllFolds == closeFoldsWith(0)

vim.keymap.set('n', '<leader>J', require('ufo').openAllFolds)
vim.keymap.set('n', '<leader>K', require('ufo').closeAllFolds)
vim.keymap.set('n', '<leader>j', require('ufo').openFoldsExceptKinds)
vim.keymap.set('n', '<leader>k', require('ufo').closeFoldsWith)

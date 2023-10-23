vim.keymap.set('n', '<leader>ha', require('harpoon.mark').add_file, { desc = '[H]arpoon - [A]dd file' })
vim.keymap.set('n', '<leader>hr', require('harpoon.mark').rm_file, { desc = '[H]arpoon - [R]emove file' })
vim.keymap.set('n', '<leader>hm', require('harpoon.ui').toggle_quick_menu, { desc = '[H]arpoon - [M]enu' })

vim.keymap.set('n', '<leader>hh', function() require('harpoon.ui').nav_file(1) end, { desc = '[H]arpoon - File 1' })
vim.keymap.set('n', '<leader>hj', function() require('harpoon.ui').nav_file(2) end, { desc = '[H]arpoon - File 2' })
vim.keymap.set('n', '<leader>hk', function() require('harpoon.ui').nav_file(3) end, { desc = '[H]arpoon - File 3' })
vim.keymap.set('n', '<leader>hl', function() require('harpoon.ui').nav_file(4) end, { desc = '[H]arpoon - File 4' })

vim.keymap.set('n', '<leader>hf', '<Cmd>Telescope harpoon marks<CR>', { desc = '[H]arpoon - [F]ind files' })

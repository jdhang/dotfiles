local ts_tools_ok = pcall(require, 'typescript-tools')

if not ts_tools_ok then
  print('typescript-tools is not installed!')
  return
end

require('typescript-tools').setup {
  settings = {
    expose_as_code_actions = {
      'all'
    },
  },
}

vim.keymap.set('n', '<leader>toi', '<cmd>TSToolsOrganizeImports<CR>', { desc = '[T]ypescript [O]rganize [I]mports' })
vim.keymap.set('n', '<leader>tsi', '<cmd>TSToolsSortImports<CR>', { desc = '[T]ypescript [S]ort [I]mports' })
vim.keymap.set('n', '<leader>tru', '<cmd>TSToolsRemoveUnused<CR>', { desc = '[T]ypescript [R]emove [U]nused' })
vim.keymap.set('n', '<leader>tri', '<cmd>TSToolsRemoveUnusedImports<CR>',
  { desc = '[T]ypescript [R]emove Unused [I]mports' })
vim.keymap.set('n', '<leader>tai', '<cmd>TSToolsAddMissingImports<CR>',
  { desc = '[T]ypescript [A]dd Missing [I]mports' })
vim.keymap.set('n', '<leader>tf', '<cmd>TSToolsFixAll<CR>', { desc = '[T]ypescript [F]ix all' })
vim.keymap.set('n', '<leader>tsd', '<cmd>TSToolsGoToSourceDefinition<CR>',
  { desc = '[T]ypescript Go To [S]ource [D]efinition' })
vim.keymap.set('n', '<leader>trn', '<cmd>TSToolsRenameFile<CR>', { desc = '[T]ypescript [R]ename [F]ile' })

local lspsaga_ok = pcall(require, 'lspsaga')

if not lspsaga_ok then
  print('lsp-saga is not installed!')
  return
end

vim.keymap.set('n', 'lf', '<cmd>Lspsaga finder<CR>')
vim.keymap.set({ 'n', 'v' }, '<leader>la', '<cmd>Lspsaga code_action<CR>')
vim.keymap.set('n', 'lr', '<cmd>Lspsaga rename<CR>')
vim.keymap.set('n', 'lrp', '<cmd>Lspsaga rename ++project<CR>')
-- <C-t> to go back to previous
vim.keymap.set('n', 'ld', '<cmd>Lspsaga goto_definition<CR>')

vim.keymap.set('n', '<leader>sl', '<cmd>Lspsaga show_line_diagnostics<CR>')
vim.keymap.set('n', '<leader>sc', '<cmd>Lspsaga show_cursor_diagnostics<CR>')
vim.keymap.set('n', '<leader>sb', '<cmd>Lspsaga show_buf_diagnostics<CR>')

vim.keymap.set('n', 'lK', '<cmd>Lspsaga hover_doc<CR>')
-- Call hierarchy
vim.keymap.set('n', '<Leader>ci', '<cmd>Lspsaga incoming_calls<CR>')
vim.keymap.set('n', '<Leader>co', '<cmd>Lspsaga outgoing_calls<CR>')

vim.keymap.set('n', '[g', '<cmd>Lspsaga diagnostic_jump_prev<CR>')
vim.keymap.set('n', ']g', '<cmd>Lspsaga diagnostic_jump_next<CR>')
-- Diagnostic jump with filters such as only jumping to an error
vim.keymap.set('n', '[G', function()
  require('lspsaga.diagnostic'):goto_prev({ severity = vim.diagnostic.severity.ERROR })
end)
vim.keymap.set('n', ']G', function()
  require('lspsaga.diagnostic'):goto_next({ severity = vim.diagnostic.severity.ERROR })
end)

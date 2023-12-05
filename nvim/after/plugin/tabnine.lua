local tabnine_ok = pcall(require, 'tabnine')

if not tabnine_ok then
  print('tabnine not installed!')
  return
end

require('tabnine').setup({
  disable_auto_comment = true,
  accept_keymap = "<tab>",
  dismiss_keymap = "<c-]>",
  debounce_ms = 800,
  suggestion_color = { gui = "#808080", cterm = 244 },
  exclude_filetypes = { "TelescopePrompt", "NvimTree" },
  log_file_path = nil, -- absolute path to Tabnine log file
})

vim.keymap.set('n', '<leader>tt', '<Cmd>TabnineToggle<CR>', { desc = '[T]abnine - [T]oggle' })

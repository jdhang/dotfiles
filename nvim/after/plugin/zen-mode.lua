local zen_mode_ok = pcall(require, 'zen-mode')

if not zen_mode_ok then
  print('zen-mode is not installed!')
  return
end

vim.keymap.set("n", "<leader>zz", function()
  require("zen-mode").setup {
    window = {
      width = 90,
      options = {}
    },
  }
  require("zen-mode").toggle()
  vim.wo.wrap = false
  vim.wo.number = true
  vim.wo.rnu = true
end)


vim.keymap.set("n", "<leader>zZ", function()
  require("zen-mode").setup {
    window = {
      width = 90,
      options = {}
    },
  }
  require("zen-mode").toggle()
  vim.wo.wrap = false
  vim.wo.number = false
  vim.wo.rnu = false
  vim.opt.colorcolumn = "0"
end)

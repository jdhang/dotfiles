local harpoon_ok, harpoon = pcall(require, "harpoon")

if not harpoon_ok then
  print("harpoon not installed!")
  return
end

-- REQUIRED
harpoon:setup()
-- REQUIRED

vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end)
vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<C-j>", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<C-k>", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<C-l>", function() harpoon:list():select(4) end)
vim.keymap.set("n", "<leader><C-h>", function() harpoon:list():replace_at(1) end)
vim.keymap.set("n", "<leader><C-j>", function() harpoon:list():replace_at(2) end)
vim.keymap.set("n", "<leader><C-k>", function() harpoon:list():replace_at(3) end)
vim.keymap.set("n", "<leader><C-l>", function() harpoon:list():replace_at(4) end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<C-n>", function() harpoon:list():prev() end)
vim.keymap.set("n", "<C-m>", function() harpoon:list():next() end)

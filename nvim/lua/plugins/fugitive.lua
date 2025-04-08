return {
  {
    "tpope/vim-fugitive",

    config = function()
      vim.keymap.set('n', '<leader>gs', vim.cmd.Git, { desc = '[g]it - [s]tatus' })
      vim.keymap.set('n', '<leader>gb', '<cmd>Git blame<CR>', { desc = '[g]it - [b]lame' })
      vim.keymap.set('n', '<leader>gd', '<cmd>Git diff<CR>', { desc = '[g]it - [d]iff' })
    end
  },
}

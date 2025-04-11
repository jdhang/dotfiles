return {
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    enabled = true,
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        move_cursor = false,
      })
    end,
  },

  {
    'echasnovski/mini.surround',
    enabled = true,
    version = false,
    config = function()
      require('mini.surround').setup({
        mappings = {
          add = "gsa",                      -- Add surrounding in Normal and Visual modes
          delete = "gsd",                   -- Delete surrounding
          find = "gsf",                     -- Find surrounding (to the right)
          find_left = "gsF",                -- Find surrounding (to the left)
          highlight = "gsh",                -- Highlight surrounding
          replace = "gsr",                  -- Replace surrounding
          update_n_lines = "gsn",           -- Update `n_lines`
        },
      })
    end
  },
}

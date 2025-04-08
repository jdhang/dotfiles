return {
  {
    "nvim-telescope/telescope.nvim",

    -- tag = "0.1.8",
    branch = "0.1.x",

    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
      },
    },

    config = function()
      require('telescope').setup({
        defaults = require('telescope.themes').get_ivy(),
        pickers = {
          git_files = {
            winblend = 10,
            theme = 'dropdown',
            previewer = false,
            layout_config = {
              height = 0.8,
              width = 0.5,
            }
          }
        },
        extensions = {
          fzf = {}
        }
      })

      require('telescope').load_extension('fzf')

      local builtin = require('telescope.builtin')

      vim.keymap.set('n', '<leader><space>', builtin.buffers, { desc = '[ ] Find existing buffers' })
      vim.keymap.set('n', '<leader>/', require('telescope.builtin').current_buffer_fuzzy_find,
        { desc = '[/] Fuzzily search in current buffer' })

      vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = '[S]earch Git Files' })
      vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
      vim.keymap.set('n', '<leader>sc', function()
        builtin.find_files({ cwd = vim.fn.stdpath("config") })
      end, { desc = '[S]earch [c]onfig files' })
      vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
      vim.keymap.set('n', '<leader>sw',
        function()
          local word = vim.fn.expand("<cword>")
          builtin.grep_string({ search = word })
        end, { desc = '[S]earch [w]ord' })
      vim.keymap.set('n', '<leader>sW',
        function()
          local word = vim.fn.expand("<cWORD>")
          builtin.grep_string({ search = word })
        end, { desc = '[S]earch [W]ord' })
      vim.keymap.set('n', '<leader>ss', function() builtin.grep_string({ search = vim.fn.input("Grep > ") }) end,
        { desc = '[S]earch Grep' })
      vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by Live [G]rep' })
      vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
    end
  }
}

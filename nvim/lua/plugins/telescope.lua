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
        defaults = require('telescope.themes').get_ivy({
          layout_config = { height = 0.30 },
        }),
        pickers = {
          git_files = {
            -- borderchars = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
            winblend = 10,
            previewer = false,
            theme = "dropdown",
            -- layout_strategy = "vertical",
            layout_config = {
              height = function(_, _, rows)
                return math.floor(rows * 0.90)
              end,
              width = 0.40,
            },
          }
        },
        extensions = {
          fzf = {}
        }
      })

      require('telescope').load_extension('fzf')

      local builtin = require('telescope.builtin')

      vim.keymap.set('n', '<leader>sf', builtin.find_files)
      vim.keymap.set('n', '<C-p>', builtin.git_files)
      vim.keymap.set('n', '<leader><space>', function()
        builtin.buffers({ sort_mru = true })
      end, { desc = '[] Find existing buffers' })
      vim.keymap.set('n', '<leader>/', builtin.current_buffer_fuzzy_find)
      vim.keymap.set('n', '<leader>sh', builtin.help_tags)
      vim.keymap.set('n', '<leader>sg', require("custom.telescope.multi-ripgrep"),
        { desc = '[S]earch by Live Multi-rip[g]rep' })

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
      vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })

      vim.keymap.set('n', '<leader>sc', function()
        builtin.find_files({ cwd = vim.fn.stdpath("config") })
      end, { desc = '[S]earch [c]onfig files' })
    end
  }
}

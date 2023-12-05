local telescope_ok = pcall(require, 'telescope')

local winheight = 0.6
local winwidth = 0.75

if not telescope_ok then
  print('telescope is not installed!')
  return
end

local pickers_opts = {
  winblend = 10,
  theme = "dropdown",
  previewer = false,
  layout_config = {
    height = winheight,
    width = winwidth,
  }
}
local dropdown_opts = {
  winblend = 10,
  layout_config = {
    height = winheight,
    width = winwidth,
  },
}

require('telescope').setup {
  defaults = {
    layout_strategy = 'vertical',
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
  },
  pickers = {
    find_files = pickers_opts,
    current_buffer_fuzzy_find = pickers_opts,
    live_grep = pickers_opts,
  }
}
require("telescope").load_extension('harpoon')

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')

-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', require('telescope.builtin').current_buffer_fuzzy_find,
  { desc = '[/] Fuzzily search in current buffer' })

vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
-- vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
-- vim.keymap.set('n', '<leader>sS', require('telescope.builtin').symbols, { desc = '[S]earch [S]ymbols' })
-- vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sr', require('telescope.builtin').resume, { desc = '[S]earch [R]esume' })
vim.keymap.set('n', '<C-p>', function()
  require('telescope.builtin').git_files(require('telescope.themes').get_dropdown(dropdown_opts))
end, { desc = 'Search [G]it [F]iles - Dropdown' })

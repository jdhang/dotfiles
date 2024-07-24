local telescope_ok = pcall(require, 'telescope')

local winheight = 0.65
local winwidth = 0.8

if not telescope_ok then
  print('telescope is not installed!')
  return
end

local pickers_opts = {
  winblend = 10,
  -- theme = "dropdown",
  previewer = false,
  layout_config = {
    height = winheight,
    width = winwidth,
  }
}
-- local dropdown_opts = {
--   winblend = 10,
--   layout_config = {
--     height = winheight,
--     width = winwidth,
--   },
-- }

require('telescope').setup {
  defaults = {
    -- layout_strategy = 'vertical',
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
  },
  pickers = {
    find_files = pickers_opts,
    git_files = pickers_opts,
    current_buffer_fuzzy_find = pickers_opts,
    -- live_grep = pickers_opts,
  }
}

local builtin = require('telescope.builtin')

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')

-- require("telescope").load_extension('harpoon')
-- basic telescope configuration for harpoon
local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
  local file_paths = {}
  for _, item in ipairs(harpoon_files.items) do
    table.insert(file_paths, item.value)
  end

  require("telescope.pickers").new({}, {
    prompt_title = "Harpoon",
    finder = require("telescope.finders").new_table({
      results = file_paths,
    }),
    previewer = conf.file_previewer({}),
    sorter = conf.generic_sorter({}),
  }):find()
end
vim.keymap.set("n", "<leader>e", function() toggle_telescope(require('harpoon'):list()) end,
  { desc = "Open harpoon window" })

-- See `:help telescope.builtin`
-- vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', builtin.buffers, { desc = '[ ] Find existing buffers' })
-- vim.keymap.set('n', '<leader>/', require('telescope.builtin').current_buffer_fuzzy_find,
--   { desc = '[/] Fuzzily search in current buffer' })

vim.keymap.set('n', '<leader>gf', builtin.git_files, { desc = '[S]earch [G]it Files' })
vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
-- vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sw', function()
  local word = vim.fn.expand("<cword>")
  builtin.grep_string({ search = word })
end, { desc = '[S]earch [w]ord' })
vim.keymap.set('n', '<leader>sW', function()
  local word = vim.fn.expand("<cWORD>")
  builtin.grep_string({ search = word })
end, { desc = '[S]earch [W]ord' })
vim.keymap.set('n', '<leader>ss', function()
  builtin.grep_string({ search = vim.fn.input("Grep > ") })
end, { desc = '[S]earch Grep' })
vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by Live Grep' })
-- vim.keymap.set('n', '<leader>sS', require('telescope.builtin').symbols, { desc = '[S]earch [S]ymbols' })
-- vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
-- vim.keymap.set('n', '<C-p>', function()
--   require('telescope.builtin').git_files(require('telescope.themes').get_dropdown(dropdown_opts))
-- end, { desc = 'Search [G]it [F]iles - Dropdown' })

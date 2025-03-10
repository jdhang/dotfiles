local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',
  'tpope/vim-sleuth',

  'mbbill/undotree',

  -- colorschemes
  {
    'rose-pine/neovim',
    priority = 1000,
    config = function()
      require('rose-pine').setup({
        disable_background = true,
        styles = {
          italic = false,
        },
      })
    end,
    opts = {}
  },

  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        -- your configuration comes here
        -- or leave it empty to use the default settings
        style = "storm",        -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
        transparent = true,     -- Enable this to disable setting the background color
        terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
        styles = {
          -- Style to be applied to different syntax groups
          -- Value is any valid attr-list value for `:help nvim_set_hl`
          comments = { italic = false },
          keywords = { italic = false },
          -- Background styles. Can be "dark", "transparent" or "normal"
          sidebars = "dark", -- style for sidebars, see below
          floats = "dark",   -- style for floating windows
        },
      })
    end,
    opts = {}
  },

  {
    'rebelot/kanagawa.nvim',
    lazy = false,
    priority = 1000,
    opts = {}
  },

  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    opts = {}
  },

  {
    "nyoom-engineering/oxocarbon.nvim",
    lazy = false,
    priority = 1000,
  },

  {
    "EdenEast/nightfox.nvim",
    lazy = false,
    priority = 1000,
  },

  { 'numToStr/Comment.nvim',   opts = {} },

  -- { 'nvim-lualine/lualine.nvim', opts = {} },

  { 'lewis6991/gitsigns.nvim', opts = {} },

  -- Useful plugin to show you pending keybinds.
  -- { 'folke/which-key.nvim',  opts = {} },

  { 'folke/zen-mode.nvim',     opts = {} },

  {
    'folke/trouble.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {},
  },

  -- harpoon v1
  -- {
  --   'theprimeagen/harpoon',
  --   dependencies = { 'nvim-lua/plenary.nvim' },
  --   opts = {},
  -- },

  -- harpoon2
  {
    'ThePrimeagen/harpoon',
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" }
  },

  -- {
  --   'windwp/nvim-autopairs',
  --   opts = {
  --     disable_filetype = { 'TelescopePrompt', 'vim' },
  --   }
  -- },

  -- Folding
  {
    'kevinhwang91/nvim-ufo',
    dependencies = { 'kevinhwang91/promise-async' },
    opts = {},
  },

  -- Add indentation guides even on blank lines
  -- {
  --   'lukas-reineke/indent-blankline.nvim',
  --   main = "ibl",
  --   opts = {},
  -- },

  -- Surround selection
  -- {
  --   'kylechui/nvim-surround',
  --   --   version = false,
  --   version = '*', -- Use for stability; omit to use `main` branch for the latest features
  --   event = 'VeryLazy',
  --   config = function()
  --     require('nvim-surround').setup()
  --   end
  -- },
  {
    'echasnovski/mini.surround',
    version = false,
    config = function()
      require('mini.surround').setup({
        mappings = {
          add = "gsa",            -- Add surrounding in Normal and Visual modes
          delete = "gsd",         -- Delete surrounding
          find = "gsf",           -- Find surrounding (to the right)
          find_left = "gsF",      -- Find surrounding (to the left)
          highlight = "gsh",      -- Highlight surrounding
          replace = "gsr",        -- Replace surrounding
          update_n_lines = "gsn", -- Update `n_lines`
        },
      })
    end
  },

  -- Fuzzy Finder (files, lsp, etc)
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      -- Fuzzy Finder Algorithm which requires local dependencies to be built.
      -- Only load if `make` is available. Make sure you have the system
      -- requirements installed.
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        -- NOTE: If you are having trouble with this installation,
        --       refer to the README for telescope-fzf-native for more instructions.
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
    },
  },

  -- Highlight, edit, and navigate code
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
      -- {
      --   'nvim-treesitter/nvim-treesitter-context',
      --   opts = { mode = "cursor", max_lines = 3 },
      -- },
      {
        'JoosepAlviste/nvim-ts-context-commentstring',
        config = function()
          require('ts_context_commentstring').setup({})
        end
      },
      { 'windwp/nvim-ts-autotag', opts = {} },
    },
    build = ':TSUpdate',
  },

  {
    'nvim-treesitter/playground',
    config = function() end,
    opts = {}
  },

  -- Typescript integration
  {
    'pmizio/typescript-tools.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
    opts = {},
  },

  -- Lua development
  {
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    opts = {},
    -- opts = {
    --   library = {
    --     -- See the configuration section for more details
    --     -- Load luvit types when the `vim.uv` word is found
    --     { path = "${3rd}/luv/library", words = { "vim%.uv" } },
    --   },
    -- },
  },

  -- LSP Configuration & Plugins
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      { 'williamboman/mason.nvim', config = true },
      'williamboman/mason-lspconfig.nvim',

      'saghen/blink.cmp'
    },
  },

  -- Autocompletion
  {
    'saghen/blink.cmp',
    dependencies = {
      { 'L3MON4D3/LuaSnip', version = 'v2.*' },
      'rafamadriz/friendly-snippets',
    },
    version = '*',
    opts_extend = { "sources.default" }
  },

  -- copilot
  'github/copilot.vim',

  -- copilot: lua version
  -- {
  --   "zbirenbaum/copilot.lua",
  --   config = function()
  --     require("copilot").setup()
  --   end,
  -- },

  -- codeium
  -- {
  --   "Exafunction/codeium.nvim",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "hrsh7th/nvim-cmp",
  --   },
  --   config = function()
  --     require("codeium").setup({
  --     })
  --   end
  -- },

  -- tabnine
  -- {
  --   'codota/tabnine-nvim',
  --   build = "./dl_binaries.sh"
  -- },

  -- Custom plugins
  require('kickstart.plugins.autoformat'),
})

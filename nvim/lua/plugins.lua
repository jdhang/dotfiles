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
    event = 'InsertEnter',
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
      -- 'giuxtaposition/blink-cmp-copilot',
      -- 'Kaiser-Yang/blink-cmp-avante',
    },
    version = '*',
    opts_extend = { "sources.default" }
  },

  -- copilot
  -- 'github/copilot.vim',

  -- copilot: lua version
  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    event = 'InsertEnter',
    config = function()
      require('copilot').setup({
        suggestion = {
          enabled = true,
          auto_trigger = false,
          hide_during_completion = false,
          debounce = 25,
          keymap = {
            accept = false,
            accept_word = false,
            accept_line = "<Tab>",
            next = false,
            prev = false,
            dismiss = false,
          },
        },
        panel = { enabled = false },
        copilot_node_command = "/opt/homebrew/bin/node", -- Node.js version must be > 20
      })
    end,
  },

  -- copilot chat
  -- {
  --   "CopilotC-Nvim/CopilotChat.nvim",
  --   dependencies = {
  --     { "zbirenbaum/copilot.lua" },
  --     { "nvim-lua/plenary.nvim", branch = "master" },
  --   },
  --   build = "make tiktoken",
  --   opts = {
  --     -- See Configuration section for options
  --   },
  --   -- See Commands section for default commands if you want to lazy load on them
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

  -- avante.nvim
  -- {
  --   "yetone/avante.nvim",
  --   event = "VeryLazy",
  --   version = false, -- Never set this value to "*"! Never!
  --   opts = {
  --     -- add any opts here
  --     -- for example
  --     provider = "openai",
  --     openai = {
  --       endpoint = "https://api.openai.com/v1",
  --       model = "gpt-4o",  -- your desired model (or use gpt-4o, etc.)
  --       timeout = 30000,   -- Timeout in milliseconds, increase this for reasoning models
  --       temperature = 0,
  --       max_tokens = 8192, -- Increase this to include reasoning tokens (for reasoning models)
  --       --reasoning_effort = "medium", -- low|medium|high, only used for reasoning models
  --     },
  --   },
  --   -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  --   build = "make",
  --   -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
  --   dependencies = {
  --     "nvim-treesitter/nvim-treesitter",
  --     "stevearc/dressing.nvim",
  --     "nvim-lua/plenary.nvim",
  --     "MunifTanjim/nui.nvim",
  --     --- The below dependencies are optional,
  --     -- "echasnovski/mini.pick",         -- for file_selector provider mini.pick
  --     "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
  --     -- "hrsh7th/nvim-cmp",              -- autocompletion for avante commands and mentions
  --     "ibhagwan/fzf-lua",              -- for file_selector provider fzf
  --     "nvim-tree/nvim-web-devicons",   -- or echasnovski/mini.icons
  --     "zbirenbaum/copilot.lua",        -- for providers='copilot'
  --     {
  --       -- support for image pasting
  --       "HakonHarnes/img-clip.nvim",
  --       event = "VeryLazy",
  --       opts = {
  --         -- recommended settings
  --         default = {
  --           embed_image_as_base64 = false,
  --           prompt_for_file_name = false,
  --           drag_and_drop = {
  --             insert_mode = true,
  --           },
  --           -- required for Windows users
  --           use_absolute_path = true,
  --         },
  --       },
  --     },
  --     {
  --       -- Make sure to set this up properly if you have lazy=true
  --       'MeanderingProgrammer/render-markdown.nvim',
  --       opts = {
  --         file_types = { "markdown", "Avante" },
  --       },
  --       ft = { "markdown", "Avante" },
  --     },
  --   },
  -- },

  -- Custom plugins
  require('kickstart.plugins.autoformat'),
})

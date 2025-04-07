return {
  'neovim/nvim-lspconfig',
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    'saghen/blink.cmp',
    {
      "folke/lazydev.nvim",
      opts = {
        library = {
          { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        },
      },
    },
  },

  opts = {
    servers = {
      jsonls = {},
      html = { filetypes = { 'html', 'hbs' } },
      cssls = {
        init_options = { provideFormatter = false },
        settings = {
          css = {
            lint = { unknownAtRules = 'ignore' },
          }
        }
      },
      lua_ls = {}
    }
  },

  config = function(_, opts)
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = vim.tbl_keys(opts.servers),
      automatic_installation = true,
    })

    local lspconfig = require('lspconfig')
    for server, config in pairs(opts.servers) do
      config.capabilities = vim.tbl_deep_extend('force', require('blink.cmp').get_lsp_capabilities(), {
        textDocument = {
          foldingRange = {
            dynamicRegistration = false,
            lineFoldingOnly = true
          }
          -- eslint = { validate = false },
        }
      })
      lspconfig[server].setup(config)
    end

    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>n', vim.lsp.buf.rename, { desc = 'LSP: [R]e[n]ame' })
    vim.keymap.set('n', '<leader>r', vim.lsp.buf.references, { desc = 'LSP: [R]eferences' })
    vim.keymap.set('n', '<leader>a', vim.lsp.buf.code_action, { desc = 'LSP: [C]ode [A]ction' })
    vim.keymap.set('n', 'gd', builtin.lsp_definitions, { desc = 'LSP: [G]oto [D]efinition' })
    vim.keymap.set('n', 'gr', builtin.lsp_references, { desc = 'LSP: [G]oto [R]eferences' })
    vim.keymap.set('n', 'gI', builtin.lsp_implementations, { desc = 'LSP: [G]oto [I]mplementation' })
    vim.keymap.set('n', 'gl', vim.diagnostic.open_float, { desc = 'LSP: Diagnostics' })
    vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, { desc = 'LSP: Type [D]efinition' })
  end
}

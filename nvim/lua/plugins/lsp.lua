return {
  {
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

    opts = {},

    config = function()
      local servers = {
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
        gopls = {},
        lua_ls = {}
      }
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = vim.tbl_keys(servers),
        automatic_installation = true,
      })

      -- local lspconfig = require('lspconfig')
      for server, config in pairs(servers) do
        config.capabilities = vim.tbl_deep_extend('force', require('blink.cmp').get_lsp_capabilities(), {
          textDocument = {
            foldingRange = {
              dynamicRegistration = false,
              lineFoldingOnly = true
            }
          }
        })
        vim.lsp.config(server, config)
      end


      vim.keymap.set('n', '<leader>cr', vim.lsp.buf.rename, { desc = 'LSP: Re[n]ame' })
      vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = 'LSP: [C]ode [A]ction' })
      -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, { desc = 'LSP: [R]eferences' })
      -- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = 'LSP: [G]oto [D]efinition' })
      vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { desc = 'LSP: [G]oto [D]eclaration' })
      vim.keymap.set('n', 'gT', vim.lsp.buf.type_definition, { desc = 'LSP: [G]oto [T]ype Definition' })
      vim.keymap.set('n', 'gl', vim.diagnostic.open_float, { desc = 'LSP: Diagnostics' })

      -- telescope
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', 'gr', builtin.lsp_references, { desc = 'LSP: [G]oto [R]eferences' })
      vim.keymap.set('n', 'gd', builtin.lsp_definitions, { desc = 'LSP: [G]oto [D]efinition' })
      vim.keymap.set('n', '<leader>wd', builtin.lsp_document_symbols, { desc = 'LSP: [G]oto [D]ocument Symbols' })
      -- vim.keymap.set('n', 'gI', builtin.lsp_implementations, { desc = 'LSP: [G]oto [I]mplementation' })
    end
  },
}

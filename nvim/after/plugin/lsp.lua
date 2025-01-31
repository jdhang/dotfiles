local mason_status_ok = pcall(require, 'mason')
local mason_lspconfig_ok, mason_lspconfig = pcall(require, 'mason-lspconfig')
if not (mason_status_ok and mason_lspconfig_ok) then
  print('Mason, Mason LSP Config, or Completion not installed!')
  return
end

local prettier = {
  formatCanRange = true,
  formatCommand = 'prettierd "${INPUT}"',
  formatStdin = true,
}

local on_attach = function(client, bufnr)
  -- In this case, we create a function that lets us more easily define mappings specific
  -- for LSP related items. It sets the mode, buffer and description for us each time.
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  nmap('<leader>r', vim.lsp.buf.references, '[R]eferences')
  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

  -- nmap('gd', function() vim.lsp.buf.definition() end, '[G]oto [D]efinition')
  -- nmap('gd', function() require('telescope.builtin').lsp_definitions({ reuse_win = true }) end, '[G]oto [D]efinition')
  nmap('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
  -- nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  nmap('gl', vim.diagnostic.open_float, 'Diagnostics')
  nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  -- nmap('gr', function() vim.lsp.buf.references() end, '[G]oto [R]eferences')
  nmap('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
  nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
  -- nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
  nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
  -- nmap('<leader>ws', function() vim.lsp.buf.workspace_symbol() end, '[W]orkspace [S]ymbols')

  -- See `:help K` for why this keymap
  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  vim.keymap.set('i', '<C-h>', vim.lsp.buf.signature_help, { buffer = bufnr, desc = 'LSP: Signature Documentation' })

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })

  -- Add custom autoformat and save for eslint
  if client.name == 'eslint' then
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      command = "EslintFixAll",
    })
  end
end

local servers = {
  -- gopls = {},
  -- templ = {},
  -- rust_analyzer = {},
  -- pyls = {},
  -- pyright = {},
  -- tsserver = {},
  eslint = {},
  jsonls = {},
  svelte = {},
  html = { filetypes = { 'html', 'hbs' } },
  -- htmx = {},
  cssls = {
    init_options = { provideFormatter = false },
    settings = {
      css = {
        lint = { unknownAtRules = 'ignore' },
      }
    }
  },
  efm = {
    filetypes = { 'css', 'scss' },
    init_options = {
      documentFormatting = true,
      documentRangeFormatting = true,
      provideFormatter = true,
    },
    settings = {
      rootMarkers = { '.git/ ' },
      languages   = {
        css = { prettier },
        scss = { prettier },
      }
    }
  },
  -- tailwindcss = {},
  -- biome = {},
  -- kotlin_language_server = {},
  -- java_language_server = {},

  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
}

-- Setup neovim lua configuration
require('neodev').setup()

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- for folding
capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true
}

mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
  automatic_installation = true
}

mason_lspconfig.setup_handlers {
  function(server_name)
    require('lspconfig')[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = servers[server_name],
      filetypes = (servers[server_name] or {}).filetypes,
      init_options = (servers[server_name] or {}).init_options,
    }
  end
}

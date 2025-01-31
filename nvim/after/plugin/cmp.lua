local cmp_ok, cmp = pcall(require, 'cmp')
local luasnip_ok, luasnip = pcall(require, 'luasnip')

if not (cmp_ok and luasnip_ok) then
  print('cmp and/or luasnip not installed!')
  return
end

require('luasnip.loaders.from_vscode').lazy_load()
luasnip.config.setup {}

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    -- ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    -- ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete {},
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = nil,
    ['<S-Tab>'] = nil
    -- ['<Tab>'] = cmp.mapping(function(fallback)
    --   if cmp.visible() then
    --     cmp.select_next_item()
    --   elseif luasnip.expand_or_locally_jumpable() then
    --     luasnip.expand_or_jump()
    --   else
    --     fallback()
    --   end
    -- end, { 'i', 's' }),
    -- ['<S-Tab>'] = cmp.mapping(function(fallback)
    --   if cmp.visible() then
    --     cmp.select_prev_item()
    --   elseif luasnip.locally_jumpable(-1) then
    --     luasnip.jump(-1)
    --   else
    --     fallback()
    --   end
    -- end, { 'i', 's' }),
  },
  formatting = {
    format = function(entry, vim_item)
      print(entry.source.name)
      vim_item.menu = ({
        nvim_lsp = '[LSP]',
        luasnip = '[LuaSnip]',
        cmp_tabnine = '[TN]',
        -- codeium = '[Codeium]',
        -- copilot = '[CP]',
        path = '[Path]',
        buffer = '[Buffer]',
      })[entry.source.name]
      vim_item.dup = ({
        nvim_lsp = 0,
        luasnip = 0,
        codeium = 0,
        cmp_tabnine = 0,
        buffer = 1,
        path = 1,
      })[entry.source.name] or 0
      return vim_item
    end,
  },
  sources = cmp.config.sources({
    -- { name = 'codeium' },
    { name = 'cmp_tabnine' },
    -- { name = 'copilot' },
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'path' },
  }, {
    { name = 'buffer' },
  }),
}

local blink_ok, blink = pcall(require, 'blink.cmp')
local luasnip_ok, luasnip = pcall(require, 'luasnip')

if not (blink_ok and luasnip_ok) then
  print('blink.cmp and/or luasnip not installed!')
  return
end

require('luasnip.loaders.from_vscode').lazy_load()
luasnip.config.setup {}

blink.setup {
  -- 'default' for mappings similar to built-in completion
  -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
  -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
  -- See the full "keymap" documentation for information on defining your own keymap.
  keymap = { preset = 'default' },

  appearance = {
    -- Sets the fallback highlight groups to nvim-cmp's highlight groups
    -- Useful for when your theme doesn't support blink.cmp
    -- Will be removed in a future release
    use_nvim_cmp_as_default = false,
    -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
    -- Adjusts spacing to ensure icons are aligned
    nerd_font_variant = 'mono'
  },

  cmdline = { enabled = false },

  completion = {
    accept = {
      auto_brackets = {
        enabled = true,
      },
    },
    -- list = {
    --   selection = {
    --     preselect = false,
    --     auto_insert = false,
    --   },
    -- },
    menu = {
      draw = {
        treesitter = { "lsp" },
      }
    },
    documentation = {
      auto_show = true,
      auto_show_delay_ms = 200,
    },
  },

  signature = { enabled = true },

  snippets = { preset = 'luasnip' },

  -- Default list of enabled providers defined so that you can extend it
  -- elsewhere in your config, without redefining it, due to `opts_extend`
  sources = {
    default = { 'lazydev', 'lsp', 'path', 'snippets', 'buffer' },
    providers = {
      lazydev = {
        name = 'LazyDev',
        module = 'lazydev.integrations.blink',
        -- make lazydev completions top priority (see `:h blink.cmp`)
        score_offset = 100,
      },
    },
  },
}

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
  keymap = {
    preset = 'enter',
    ["<C-y>"] = { "select_and_accept" },
  },

  appearance = {
    -- Sets the fallback highlight groups to nvim-cmp's highlight groups
    -- Useful for when your theme doesn't support blink.cmp
    -- Will be removed in a future release
    use_nvim_cmp_as_default = false,
    -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
    -- Adjusts spacing to ensure icons are aligned
    nerd_font_variant = 'mono',

    -- -- Blink does not expose its default kind icons so you must copy them all (or set your custom ones) and add Copilot
    -- kind_icons = {
    --   Copilot = "",
    --   Text = '󰉿',
    --   Method = '󰊕',
    --   Function = '󰊕',
    --   Constructor = '󰒓',
    --
    --   Field = '󰜢',
    --   Variable = '󰆦',
    --   Property = '󰖷',
    --
    --   Class = '󱡠',
    --   Interface = '󱡠',
    --   Struct = '󱡠',
    --   Module = '󰅩',
    --
    --   Unit = '󰪚',
    --   Value = '󰦨',
    --   Enum = '󰦨',
    --   EnumMember = '󰦨',
    --
    --   Keyword = '󰻾',
    --   Constant = '󰏿',
    --
    --   Snippet = '󱄽',
    --   Color = '󰏘',
    --   File = '󰈔',
    --   Reference = '󰬲',
    --   Folder = '󰉋',
    --   Event = '󱐋',
    --   Operator = '󰪚',
    --   TypeParameter = '󰬛',
    -- },
  },

  cmdline = { enabled = false },

  completion = {
    accept = {
      auto_brackets = {
        enabled = true,
        kind_resolution = {
          blocked_filetypes = { "typescriptreact", "javascriptreact", "vue", "codecompanion" },
        },
      },
    },
    list = {
      selection = {
        preselect = false,
        -- auto_insert = false,
      },
    },
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
    -- default = { 'lazydev', 'lsp', 'path', 'snippets', 'buffer', 'copilot' },
    providers = {
      -- copilot = {
      --   name = "copilot",
      --   module = "blink-cmp-copilot",
      --   score_offset = 100,
      --   async = true,
      --   transform_items = function(_, items)
      --     local CompletionItemKind = require("blink.cmp.types").CompletionItemKind
      --     local kind_idx = #CompletionItemKind + 1
      --     CompletionItemKind[kind_idx] = "Copilot"
      --     for _, item in ipairs(items) do
      --       item.kind = kind_idx
      --     end
      --     return items
      --   end,
      -- },
      lazydev = {
        name = 'LazyDev',
        module = 'lazydev.integrations.blink',
        -- make lazydev completions top priority (see `:h blink.cmp`)
        score_offset = 100,
      },
    },
  },
}

-- vim.api.nvim_create_autocmd("User", {
--   pattern = "BlinkCmpMenuOpen",
--   callback = function()
--     vim.b.copilot_suggestion_hidden = true
--   end,
-- })
--
-- vim.api.nvim_create_autocmd("User", {
--   pattern = "BlinkCmpMenuClose",
--   callback = function()
--     vim.b.copilot_suggestion_hidden = false
--   end,
-- })

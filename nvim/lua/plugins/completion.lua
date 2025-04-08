return {
  {
    'saghen/blink.cmp',
    dependencies = {
      'rafamadriz/friendly-snippets',
      "giuxtaposition/blink-cmp-copilot",
    },

    version = '1.*',

    opts = {
      keymap = { preset = 'default' },

      appearance = {
        nerd_font_variant = 'mono'
      },

      cmdline = { enabled = false },

      fuzzy = { implementation = "prefer_rust_with_warning" },

      signature = { enabled = true },

      sources = {
        default = { "lazydev", "lsp", "path", "snippets", "buffer", "copilot" },
        providers = {
          copilot = {
            name = "copilot",
            module = "blink-cmp-copilot",
            score_offset = 100,
            async = true,
          },
          lazydev = {
            name = "LazyDev",
            module = "lazydev.integrations.blink",
            -- make lazydev completions top priority (see `:h blink.cmp`)
            score_offset = 100,
          },
        },
      },
    },
  },
}

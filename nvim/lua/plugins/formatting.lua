return {
  "stevearc/conform.nvim",

  dependencies = { "mason.nvim" },

  lazy = true,

  cmd = "ConformInfo",

  keys = {
    {
      "<leader>f",
      function()
        require("conform").format({
          timeout_ms = 3000,
          async = true,
          quiet = true,
          lsp_format = "fallback",
        })
      end,
      mode = { "n", "v" },
      desc = "Format buffer",
    },
  },

  opts = {},

  config = function()
    require("conform").setup({
      formatters_by_ft = {
        css = { "prettierd", "prettier", stop_after_first = true },
        scss = { "prettierd", "prettier", stop_after_first = true },
      },

      format_on_save = {
        timeout_ms = 3000,
        async = false,
        quiet = false,
        lsp_format = "fallback",
      }
    })
  end
}

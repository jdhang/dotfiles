function NormalizeColors(color)
  color = color or "rose-pine-moon"

  vim.cmd.colorscheme(color)

  vim.opt.background = "dark"

  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })
end

return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    opts = {},
    config = function()
      NormalizeColors();
    end
  },

  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      require('rose-pine').setup({
        disable_background = true,
        styles = {
          italic = false,
        },
      })

      NormalizeColors();
    end
  },
}

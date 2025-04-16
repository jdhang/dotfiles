function NormalizeColors(color)
  color = color or "rose-pine"

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
    enabled = false,
    lazy = false,
    priority = 1000,
    config = function()
      NormalizeColors('tokyonight-night');
    end
  },

  {
    "rebelot/kanagawa.nvim",
    enabled = false,
    config = function()
      require('kanagawa').setup({
        commentStyle = { italic = false },
        keywordStyle = { italic = false },
      })

      NormalizeColors('kanagawa-dragon');
    end
  },

  {
    "rose-pine/neovim",
    name = "rose-pine",
    enabled = true,
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

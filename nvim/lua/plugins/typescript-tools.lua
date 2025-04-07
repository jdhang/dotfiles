return {
  'pmizio/typescript-tools.nvim',

  dependencies = {
    'nvim-lua/plenary.nvim',
    'neovim/nvim-lspconfig',
  },

  opts = {},

  config = function()
    require('typescript-tools').setup {
      settings = {
        expose_as_code_actions = { 'all' },
      },
    }
  end
}

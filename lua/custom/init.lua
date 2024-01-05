require('lazy').setup({
  -- Git related plugins
  'tpope/vim-rhubarb',

  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

  -- Visual multi cursor
  'mg979/vim-visual-multi',

  -- UI
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
  },

  -- Useful plugin to show you pending keybinds.
  { 'folke/which-key.nvim', opts = {} },

  {
    -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help ibl`
    main = 'ibl',
    opts = {},
  },

  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },

  { import = 'custom.plugins' },
}, {})

require 'custom.lsp'
require 'custom.settings'
require 'custom.mappings'

-- Plugins config
require 'custom.plugins.configs.telescope'
require 'custom.plugins.configs.nvim-tree'
require 'custom.plugins.configs.lspconfig'

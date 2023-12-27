return {

  "ThePrimeagen/vim-be-good",
  "catppuccin/nvim",
  "nvim-lualine/lualine.nvim",
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
      "3rd/image.nvim",
    },
  },
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  "nvim-itter/nvim-treesitter-context",
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = 'v3.x',
    dependencies = {
      -- mason for managing LSPs
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/nvim-cmp",
      "L3MON4D3/LuaSnip",
      "rafamadriz/friendly-snippets",
      "onsails/lspkind.nvim",
      "lukas-reineke/lsp-format.nvim",
    },
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    }
  },
  "jiangmiao/auto-pairs",
}

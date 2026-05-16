return {
  {
    "mason-org/mason.nvim",
    opts = {
      "clangd",
      "codelldb",
    },
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
    lazy = false,
  },

  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",
      "jay-babu/mason-nvim-dap.nvim",
      "mfussenegger/nvim-dap-python",
    },
    config = function()
      require "configs.dap"
    end,
    lazy = false,
  },

  {
    "nvim-tree/nvim-tree.lua",
    -- cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    lazy = false,
    opts = function()
      require("nvim-tree").setup()
      return require "configs.nvimtree"
    end,
  },

  {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate'
  },

  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      -- optional but recommended
    }
  },

  {
    "lervag/vimtex",
    lazy = false,
    init = function()
      vim.g.vimtex_view_method = 'zathura'
      vim.g.vimtex_complete_enabled = 0
    end
  },

  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    lazy = false,
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  },

  {
    "karb94/neoscroll.nvim",
    opts = {},
    lazy = false,
  },
}

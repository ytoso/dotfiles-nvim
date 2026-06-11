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
    'Bekaboo/dropbar.nvim',
    -- optional, but required for fuzzy finder support
    dependencies = {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make'
    },
    lazy = false,
    config = function()
      local dropbar_api = require('dropbar.api')
      vim.keymap.set('n', '<Leader>;', dropbar_api.pick, { desc = 'Pick symbols in winbar' })
      vim.keymap.set('n', '[;', dropbar_api.goto_context_start, { desc = 'Go to start of current context' })
      vim.keymap.set('n', '];', dropbar_api.select_next_context, { desc = 'Select next context' })
    end
  },
}

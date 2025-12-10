return {
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
    },
    config = function()
      require "configs.dap"
    end,
    lazy = false,
  },

  {
    "mason-org/mason.nvim",
    opts = {
      "clangd",
      "codelldb",
    },
  },
}

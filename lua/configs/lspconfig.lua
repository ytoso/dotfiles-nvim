require("nvchad.configs.lspconfig").defaults()

local servers = { "clangd", "verible" }
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers 

vim.lsp.config.verible = {
  cmd = { "verible-verilog-ls", "--rules_config_search" },
  settings = {
    verible = {
      formatting = {
        enabled = true,
      },
    },
  },
}

vim.keymap.set("n", "\\f", function()
  vim.lsp.buf.format({ async = false })
end, { desc = "LSP : Format whole file" })

vim.keymap.set("n", "\\q", vim.lsp.buf.code_action, {
  desc = "LSP : Code Action",
})

vim.keymap.set("v", "\\f", function()
  vim.lsp.buf.format({ async = false })
end, { desc = "LSP : Format selection" })

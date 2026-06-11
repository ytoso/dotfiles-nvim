local map = vim.keymap.set

map('n', '<F5>', function() require('dap').continue() end)
map('n', '<F6>', function()
  require('dap').close();
  require('dapui').close();
end)
map('n', '<F1>', function() require('dap').step_over() end)
map('n', '<F2>', function() require('dap').step_into() end)
map('n', '<F14>', function() require('dap').step_into{askForTargets = true} end)
map('n', '<F3>', function() require('dap').step_out() end)
map('n', '<F4>', function() require('dap').run_to_cursor() end, { desc = 'DAP: Run to Cursor' })
map('n', '<Leader>b', function() require('dap').toggle_breakpoint() end)
map('n', '<Leader>c', function()
  require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))
end, { desc = 'DAP Conditional Breakpoint' })

vim.api.nvim_set_hl(0, 'DapBreakpoint', { ctermbg = 0, fg = '#993939', bg = '' })
vim.api.nvim_set_hl(0, 'DapLogPoint', { ctermbg = 0, fg = '#61afef', bg = '#31353f' })
vim.api.nvim_set_hl(0, 'DapStopped', { ctermbg = 0, fg = '#98c379', bg = '#31353f' })
vim.fn.sign_define('DapBreakpoint', { text='●', texthl='DapBreakpoint', linehl='', numhl='' })
vim.fn.sign_define('DapBreakpointCondition', { text='ﳁ', texthl='DapBreakpoint', linehl='DapBreakpoint', numhl='DapBreakpoint' })
vim.fn.sign_define('DapBreakpointRejected', { text='', texthl='DapBreakpoint', linehl='DapBreakpoint', numhl= 'DapBreakpoint' })
vim.fn.sign_define('DapLogPoint', { text='', texthl='DapLogPoint', linehl='DapLogPoint', numhl= 'DapLogPoint' })
vim.fn.sign_define('DapStopped', { text='', texthl='DapStopped', linehl='DapStopped', numhl= 'DapStopped' })

local dap, dapui = require("dap"), require("dapui")
dapui.setup()

dap.listeners.before.attach.dapui_config = function()
  dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
  dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
  dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
  dapui.close()
end

require("mason-nvim-dap").setup({
  ensure_installed = { "python", "codelldb" },
  automatic_installation = true,
})

require("dap-python").setup("python")
require('dap').configurations.python = {}

dap.adapters.codelldb = {
  type = "executable",
  command = "codelldb",
}

local M = {}

function M.setup()
  local dap = require "dap"
  dap.configurations.cs = {
    {
      type = "coreclr",
      name = "launch - netcoredbg",
      request = "launch",
      program = function()
        return vim.fn.input('Path to dll', vim.fn.getcwd() .. '/bin/Debug/', 'file')
      end,
    },
  }

  dap.adapters.coreclr = {
    type = 'executable',
    command = '/path/to/dotnet/netcoredbg/netcoredbg',
    args = { '--interpreter=vscode' }
  }

end

return M

-- TODO: https://github.com/Samsung/netcoredbg/issues/91
-- TODO: make this work https://github.com/Samsung/netcoredbg/issues/68
local M = {}

function M.setup()
  local dap = require "dap"
  local dap_utils = require "dap.utils"

  -- netcoredbg --interpreter=cli -- dotnet run --project Intellya.Application.Selecta.Administration.Api
  dap.adapters.coreclr = {
    type = 'executable',
    command = '/home/nikola/tools/netcoredbg/netcoredbg',
    args = { '--interpreter=vscode' }
  }

  dap.configurations.cs = {
    {
      type = "coreclr",
      name = "launch - netcoredbg",
      request = "launch",
      -- program = "--project Intellya.Application.Selecta.Administration.Api"
      -- program = "-- dotnet run --project Intellya.Application.Selecta.Administration.Api"
      program = function()
        return vim.fn.input('Path to dll: ', vim.fn.getcwd() .. '/bin/Debug/', 'file')
      end,
    },
    {
      name = ".NET Core Attach",
      type = "coreclr",
      request = "attach",
      processId = dap_utils.pick_process,
    }
  }

end

return M

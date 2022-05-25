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

  -- dap.configurations.cs = {
  --   {
  --     type = "coreclr",
  --     name = "launch - netcoredbg",
  --     request = "launch",
  --     -- program = "--project Intellya.Application.Selecta.Administration.Api"
  --     -- program = "-- dotnet run --project Intellya.Application.Selecta.Administration.Api"
  --     program = function()
  --       return vim.fn.input('Path to dll: ', vim.fn.getcwd() .. '/bin/Debug/', 'file')
  --     end,
  --     -- cwd = function()
  --     --   return vim.fn.input('Path to cwd: ', vim.fn.getcwd(), 'file')
  --     -- end,
  --   },
  --   {
  --     name = ".NET Core Attach",
  --     type = "coreclr",
  --     request = "attach",
  --     -- processId = dap_utils.pick_process,
  --   }
  -- }
  -- Something transformrs lanuchSettings.json into ENV varibale (ASPNETCORE_URLS etc.)
  dap.configurations.cs = {
    {
      -- Use IntelliSense to find out which attributes exist for C# debugging
      -- Use hover for the description of the existing attributes
      -- For further information visit https://github.com/OmniSharp/omnisharp-vscode/blob/master/debugger-launchjson.md
      name = ".NET Core Launch (web)",
      type = "coreclr",
      request = "launch",
      -- preLaunchTask= "build",
      -- If you have changed target frameworks, make sure to update the program path.
      -- program = "${workspaceFolder}/UnitTest_Mock/bin/Debug/net6.0/UnitTest_Mock.dll",
      program = "/home/nikola/workspace/random/xunit-testing/UnitTest_Mock/bin/Debug/net6.0/UnitTest_Mock.dll",
      args = {}, -- this fails, should be []
      cwd = "/home/nikola/workspace/random/xunit-testing/UnitTest_Mock",
      -- cwd = "${workspaceFolder}/UnitTest_Mock",
      stopAtEntry = false,
      -- Enable launching a web browser when ASP.NET Core starts. For more information: https://aka.ms/VSCode-CS-LaunchJson-WebBrowser
      -- serverReadyAction= {
      --     action= "openExternally",
      --     pattern= "\\bNow listening on:\\s+(https?://\\S+)"
      -- },
      env = {
        ASPNETCORE_ENVIRONMENT = "Development"
      },
      -- sourceFileMap= {
      --     /Views= "${workspaceFolder}/Views"
      -- }
    },
    {
      name = ".NET Core Attach",
      type = "coreclr",
      request = "attach"
    }
  }

end

return M

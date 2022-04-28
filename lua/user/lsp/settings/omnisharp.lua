local pid = vim.fn.getpid()
local omnisharp_bin = "/home/nikola/tools/omnisharp/OmniSharp.dll"

local util = require "lspconfig".util

return {
  cmd = { "dotnet", omnisharp_bin, "--languageserver", "--hostPID", tostring(pid) },
  filetypes = { "cs", "vb" },
  root_dir = util.root_pattern(".sln") or util.root_pattern(".csproj")
}

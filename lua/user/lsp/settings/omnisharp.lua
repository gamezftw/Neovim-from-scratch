-- dotnet /home/nikola/.local/share/nvim/lsp_servers/omnisharp/omnisharp/OmniSharp.dll --languageserver --hostPID 15884 -s /home/nikola/workspace/random/xunit-testing
local pid = vim.fn.getpid()

-- local omnisharp_bin = "/home/nikola/.local/share/nvim/lsp_servers/omnisharp/omnisharp/OmniSharp.dll"
local omnisharp_bin = "/home/nikola/tools/omnisharp/OmniSharp.dll"
-- local omnisharp_bin = "omnisharp"

local util = require "lspconfig".util

-- local command = "dotnet --version"
-- os.execute(command)
-- local handle = io.popen(command)
-- local result = handle:read("*a")
-- handle:close()
-- print(result)

return {
  handlers = {
    ["textDocument/definition"] = require('omnisharp_extended').handler,
  },
  -- cmd = { omnisharp_bin, "--languageserver", "--hostPID", tostring(pid) },
  cmd = { "dotnet", omnisharp_bin, "--languageserver", "--hostPID", tostring(pid) },
  filetypes = { "cs", "vb" },
  root_dir = util.root_pattern("*.sln") or util.root_pattern("*.csproj")
}

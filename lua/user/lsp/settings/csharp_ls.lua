local status_ok, csharpls_extended = pcall(require, "csharpls_extended")
if not status_ok then
  return
end

local status_ok_lspconfig, lspconfig = pcall(require, "lspconfig")
if not status_ok_lspconfig then
  return
end

local util = lspconfig.util

return {
  cmd = { "csharp-ls" },
  filetypes = { "cs" },
  handlers = {
    ["textDocument/definition"] = csharpls_extended.handler,
  },
  -- root_dir =
  root_dir = util.root_pattern(".git") or util.root_pattern("*.sln") or util.root_pattern("*.csproj")
}

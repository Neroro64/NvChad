local M = {}

M.setup_lsp = function(attach, capabilities)
   local lspconfig = require "lspconfig"

   -- lspservers with default config
   local servers = { "clangd", "pyright", "omnisharp" }

   for _, lsp in ipairs(servers) do
      if lsp == "clangd" then
        lspconfig.clangd.setup{
          on_attach = attach,
          capabilities = capabilities,
          flags = {
              debounce_text_changes = 150,
          },
          filetypes = { "c", "cpp", "objc", "objcpp", "hpp"},
          cmd = {
		"clangd",
		"--background-index",
		"--clang-tidy",
		"--completion-style=bundled",
		"--cross-file-rename",
		"--header-insertion=iwyu",
              }
        }
      elseif lsp == "omnisharp" then
        local omnisharp_bin = 'C:/ProgramData/chocolatey/lib/omnisharp/tools/OmniSharp.exe'
        lspconfig.omnisharp.setup{
          cmd = { omnisharp_bin, '--languageserver' , '--hostPID', tostring(pid) },
          on_attach = on_attach, 
          capabilities = capabilities,
	}
      else
        lspconfig[lsp].setup {
           on_attach = attach,
           capabilities = capabilities,
           flags = {
              debounce_text_changes = 150,
           },
        }
      end
   end
end
return M

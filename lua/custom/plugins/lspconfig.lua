local M = {}

M.setup_lsp = function(attach, capabilities)
	local lspconfig = require "lspconfig"

	-- lspservers with default config
	local servers = { "clangd", "pyright", "omnisharp", "powershell_es"}

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
				flags = {
					debounce_text_changes = 150,
				},
			}
		elseif lsp == "powershell_es" then
			local powershell_es_path = 'C:/Users/NuoC/.vim/PowerShellEditorServices'
			require'lspconfig'.powershell_es.setup{
				on_attach = on_attach,
				capabilities = capabilities,
				bundle_path = powershell_es_path,
				filetypes = { "ps1", "psm1" },
				cmd = {'pwsh', '-NoLogo', '-NoProfile', '-Command', powershell_es_path .. '/module/PowerShellEditorServices/Start-EditorServices.ps1', '-BundledModulesPath', powershell_es_path, '-SessionDetailsPath','./session.json', '-HostName', 'NuoC', '-HostProfileId', 'nuoc', '-LogLevel', 'Normal', '-HostVersion', '1.0.0' },
				flags = {
					debounce_text_changes = 150,
				},
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

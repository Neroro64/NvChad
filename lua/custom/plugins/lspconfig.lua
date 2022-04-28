local M = {}

M.setup_lsp = function(attach, capabilities)
	-- -------------------------------------------------------------------
	-- USING LSP_INSTALLER
	-- for more info, see https://github.com/williamboman/nvim-lsp-installer
	-- -------------------------------------------------------------------
	-- Include the servers you want to have installed by default below
	local lsp_installer = require("nvim-lsp-installer")
	-- local servers = {
	--   "pyright",
	--   "clangd",
	--   "omnisharp",
	--   -- "lemminx",
	--   "jsonls",
	--   -- "jdtls", Java
	--   -- "tsserver", JavaScript
	--   -- "texlab",
	--   "sumneko_lua",
	--   "prosemd_lsp",
	-- }

	-- for _, name in pairs(servers) do
	--   -- Auto install the servers, if not installed
	--   local server_is_found, server = lsp_installer.get_server(name)
	--   if server_is_found and not server:is_installed() then
	-- 	print("Installing " .. name)
	-- 	server:install()
	--   end
 --  end

	-- Register a handler that will be called for each installed server when it's ready (i.e. when installation is finished
	-- or if the server is already installed).
	lsp_installer.on_server_ready(function(server)
		local opts = {}

		opts.flags = { debounce_text_changes = 150 }
		if (server.name == "clangd") then
			opts.filetypes = { "c", "cpp", "objc", "objcpp", "hpp"}
			opts.cmd = {
				"clangd",
				"--background-index",
				"--clang-tidy",
				"--completion-style=bundled",
				"--cross-file-rename",
				"--header-insertion=iwyu",
			}
		elseif (server.name == "powershell_es") then
			opts.filetypes = { "ps1", "psm1" }
		end
		server:setup(opts)
	end)
	
	-- -------------------------------------------------------------------
	-- USING LSP_Config manually
	-- for more info, see https://github.com/neovim/nvim-lspconfig
	-- -------------------------------------------------------------------
	-- local lspconfig = require "lspconfig"
	--
	-- -- lspservers with default config
	-- local servers = { "clangd", "pyright", "omnisharp", "powershell_es"}
	--
	-- for _, lsp in ipairs(servers) do
	-- 	if lsp == "clangd" then
	-- 		lspconfig.clangd.setup{
	-- 			on_attach = attach,
	-- 			capabilities = capabilities,
	-- 			flags = {
	-- 				debounce_text_changes = 150,
	-- 			},
	-- 			filetypes = { "c", "cpp", "objc", "objcpp", "hpp"},
	-- 			cmd = {
	-- 				"clangd",
	-- 				"--background-index",
	-- 				"--clang-tidy",
	-- 				"--completion-style=bundled",
	-- 				"--cross-file-rename",
	-- 				"--header-insertion=iwyu",
	-- 			}
	-- 		}
	-- 	elseif lsp == "omnisharp" then
	-- 		local omnisharp_bin = 'C:/ProgramData/chocolatey/lib/omnisharp/tools/OmniSharp.exe'
	-- 		lspconfig.omnisharp.setup{
	-- 			cmd = { omnisharp_bin, '--languageserver' , '--hostPID', tostring(pid) },
	-- 			on_attach = on_attach, 
	-- 			capabilities = capabilities,
	-- 			flags = {
	-- 				debounce_text_changes = 150,
	-- 			},
	-- 		}
	-- 	elseif lsp == "powershell_es" then
	-- 		local powershell_es_path = 'C:/Users/NuoC/Documents/PowerShellEditorServices'
	-- 		require'lspconfig'.powershell_es.setup{
	-- 			on_attach = on_attach,
	-- 			capabilities = capabilities,
	-- 			bundle_path = powershell_es_path,
	-- 			filetypes = { "ps1", "psm1" },
	-- 			cmd = {'pwsh', '-NoLogo', '-NoProfile', '-Command', powershell_es_path .. '/Start-EditorServices.ps1', '-BundledModulesPath', powershell_es_path, '-SessionDetailsPath','./session.json', '-HostName', 'NuoC', '-HostProfileId', 'nuoc', '-LogLevel', 'Normal', '-HostVersion', '1.0.0' },
	-- 			flags = {
	-- 				debounce_text_changes = 150,
	-- 			},
	-- 		}
	-- 	else
	-- 		lspconfig[lsp].setup {
	-- 		on_attach = attach,
	-- 		capabilities = capabilities,
	-- 		flags = {
	-- 			debounce_text_changes = 150,
	-- 		},
	-- 		}
	-- 	end
	-- end
end
return M

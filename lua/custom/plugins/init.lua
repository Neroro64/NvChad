return {
     -- Overriding the default configs
     ["andymass/vim-matchup"] = {
      disable = true,
      setup = function()
         nvchad.packer_lazy_load "vim-matchup"
      end,
   },
   ["nvim-telescope/telescope.nvim"] = {
         setup = function()
             -- load default mappings first
             local map = nvchad.map

             -- then load your mappings
             map("n", "<leader>oi", "<cmd> :Telescope buffers <CR>")
             map("n", "<leader>of", "<cmd> :Telescope find_files <CR>")
             map("n", "<leader>ogc", "<cmd> :Telescope git_commits <CR>")
             map("n", "<leader>ogs", "<cmd> :Telescope git_status <CR>")
             map("n", "<leader>oh", "<cmd> :Telescope help_tags <CR>")
             map("n", "<leader>o/", "<cmd> :Telescope live_grep <CR>")
             map("n", "<leader>ou", "<cmd> :Telescope oldfiles <CR>")
             map("n", "<leader>oth", "<cmd> :Telescope themes <CR>")
             map("n", "<leader>otk", "<cmd> :Telescope keymaps <CR>")
             map("n", "<leader>fb", "<cmd> :Telescope buffers <CR>")

            -- pick a hidden term
            map("n", "<leader>W", "<cmd> :Telescope terms <CR>")
         end,
     },
     ["kyazdani42/nvim-tree.lua"] = {
         setup = function()
             require("core.mappings").nvimtree()
             local map = nvchad.map
             map("n", "<leader>ee", "<cmd> :NvimTreeToggle <CR>")
             map("n", "<leader>ef", "<cmd> :NvimTreeFocus <CR>")
         end,
     },
     ["neovim/nvim-lspconfig"] = {
         setup = function()
           local map = nvchad.map
             map("n", "gD", function()
               vim.lsp.buf.declaration()
             end)
             map("n", "gd", function()
               vim.lsp.buf.definition()
             end)
             map("n", "K", function()
             vim.lsp.buf.hover()
             end)

             map("n", "gi", function()
             vim.lsp.buf.implementation()
             end)

             map("n", "<leader>l", function()
             vim.lsp.buf.signature_help()
             end)

             map("n", "<leader>D", function()
             vim.lsp.buf.type_definition()
             end)

             map("n", "<leader>ra", function()
             vim.lsp.buf.rename()
             end)

             map("n", "<leader>ca", function()
             vim.lsp.buf.code_action()
             end)

             map("n", "gr", function()
             vim.lsp.buf.references()
             end)

             map("n", "<leader>f", function()
             vim.diagnostic.open_float()
             end)

             map("n", "<C-Up>", function()
             vim.diagnostic.goto_prev()
             end)

             map("n", "<C-Down>", function()
             vim.diagnostic.goto_next()
             end)

             map("n", "<leader>fd", function()
             vim.lsp.buf.formatting()
             end)

             map("n", "<leader>wa", function()
             vim.lsp.buf.add_workspace_folder()
             end)

             map("n", "<leader>wr", function()
             vim.lsp.buf.remove_workspace_folder()
             end)

             map("n", "<leader>wl", function()
             print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
             end)
           end,
     },
     ["akinsho/bufferline.nvim"] = {
         setup = function()
             require("core.mappings").bufferline()
             local map = nvchad.map
             map("n", "<leader>i", "<cmd> :BufferLinePick <CR>")
             map("n", "<leader>I", "<cmd> :BufferLinePickClose <CR>")
         end,
     },
     -- -- -- -- -- --
     -- -- -- -- -- --
     ["easymotion/vim-easymotion"] = {
         event = "BufRead",
         config = function()
             vim.cmd([[
             let g:EasyMotion_do_mapping = 0 " Disable default mappings

             " Jump to anywhere you want with minimal keystrokes, with just one key binding.
             " `s{char}{label}`
             nmap <leader>s <Plug>(easymotion-overwin-f2)
             " or
             " `s{char}{char}{label}`
             " Need one more keystroke, but on average, it may be more comfortable.
             
             " Turn on case-insensitive feature
             let g:EasyMotion_smartcase = 1
             
             " JK motions: Line motions
             map <Leader>j <Plug>(easymotion-j)
             map <Leader>k <Plug>(easymotion-k)
             ]])
         end,
     },
     ["mbbill/undotree"] = {
         setup = function()
            nvchad.packer_lazy_load "undotree"
         end,
     },
     ["junegunn/vim-easy-align"] = {
         after = "vim-easymotion",
         config = function()
             vim.cmd([[
             " Start interactive EasyAlign in visual mode (e.g. vipga)
             xmap ga <Plug>(EasyAlign)
         
             " Start interactive EasyAlign for a motion/text object (e.g. gaip)
             nmap ga <Plug>(EasyAlign)
             ]])
         end,
     },
     ["tpope/vim-surround"] = {
         after = "vim-easymotion",
         -- cs"'  ->  change " to '
         -- ds"   ->  remove "
         -- ysiw( ->  wrap word with ()
         -- yss(  ->  wrap line with ()
     },
     ["nvim-orgmode/orgmode"] = {
         setup = function()
            nvchad.packer_lazy_load "orgmode"
         end,
         config = function()
             require("custom.plugins.orgmode")
         end,
     },
     ["luukvbaal/stabilize.nvim"] = {
         config = function() require("stabilize").setup() end
     },
     ["ctrlpvim/ctrlp.vim"] = {
         setup = function()
            nvchad.packer_lazy_load "ctrlp.vim"
         end,
         config = function()
             vim.cmd([[
         	" CtrlP config
             let g:ctrlp_map = '<leader>pp'
             let g:ctrlp_user_command = "fd --type f"
             let g:ctrlp_max_height = 20
             let g:ctrlp_use_caching = 1
             let g:ctrlp_clear_cache_on_exit = 0
             let g:ctrlp_types = ['fil', 'mru']
             let g:ctrlp_custom_ignore = {
             \ 'dir':  '\v[\/]\.(idea|cache|vs)|([Bb]uild|[Bb]in)$',
             \ 'file': '\v\.(exe|so|dll|obj|pdb|nfo)$'
             \ }
             nnoremap <silent> <leader>po :CtrlP %:p:h<cr>
             nnoremap <silent> <leader>pu :CtrlPMRU<CR>
             ]])
         end,
     },
     ["tpope/vim-fugitive"] = {
         setup = function()
            nvchad.packer_lazy_load "vim-fugitive"
         end,
     },
     ["mhartington/formatter.nvim"] = {
         setup = function()
            nvchad.packer_lazy_load "formatter.nvim"
         end,
         config = function()
             -- Provides the Format and FormatWrite commands
             require('formatter').setup {
                 -- All formatter configurations are opt-in
                 filetype = {
                     lua = {
                         require('formatter.filetypes.lua').stylua,
                     },
                     cpp = {
                         require('formatter.filetypes.cpp').clangformat,
                     },
                     cs = {
                         require('formatter.filetypes.cs').dotnetformat,
                     },
                     python = {
                         require('formatter.filetypes.python').black,
                     },
                 }
             }
             -- local map = nvchad.map
             -- map("n", "<leader>fm", "<cmd> :Format<CR>")
         end,
     },
     ["folke/trouble.nvim"] = {
       requires = "kyazdani42/nvim-web-devicons",
       config = function()
         require("trouble").setup {}
         local map = nvchad.map
         map("n", "<leader>ll", "<cmd> :TroubleToggle<CR>")
         map("n", "<leader>lw", "<cmd> :TroubleToggle workspace_diagnostics<CR>")
         map("n", "<leader>ld", "<cmd> :TroubleToggle document_diagnostics<CR>")
         map("n", "<leader>lq", "<cmd> :TroubleToggle quickfix<CR>")
         map("n", "<leader>lr", "<cmd> :TroubleToggle lsp_references<CR>")
       end,
     },
     ["simrat39/symbols-outline.nvim"] = {
         setup = function()
            nvchad.packer_lazy_load "symbols-outline.nvim"
         end,
         config = function()
           local map = nvchad.map
           map('n', "<F2>", ":SymbolsOutline<CR>")
         end,
     },
     ["rafi/awesome-vim-colorschemes"] = {},
     ["iamcco/markdown-preview.nvim"] = {},
     -- ["mfussenegger/nvim-dap"] = {
     --     setup = function()
     --        nvchad.packer_lazy_load "nvim-dap"
     --     end,
     --     config = function()
     --       local map = nvchad.map
     --       map("n", "<F9>", ":lua require('dap').toggle_breakpoint()<CR>")
     --       map("n", "<F5>", ":lua require('dap').continue()<CR>")
     --       map("n", "<F10>", ":lua require('dap').step_over()<CR>")
     --       map("n", "<F11>", ":lua require('dap').step_into()<CR>")
     --       map("n", "<F12>", ":lua require('dap').step_out()<CR>")
     --
     --     end,
     --
     -- },
     -- ["ravenxrz/DAPInstall.nvim"] = {
     --     -- after = "vim-easymotion",
     --     -- setup = function()
     --     --    nvchad.packer_lazy_load "dap-buddy.nvim"
     --     -- end,
     -- },
     -- ["rcarriga/nvim-dap-ui"] = {
     --     after = "nvim-dap",
     --     requires = {"mfussenegger/nvim-dap"},
     --     config = function()
     --       local map = nvchad.map
     --       map("n", "<F4>", ":lua require('dapui').toggle()<CR>")
     --       map("n", "<Leader>dhh", ":lua require('dap.ui.variables').hover()<CR>")
     --       map("v", "<Leader>dhh", ":lua require('dap.ui.variables').visual_hover()<CR>")
     --       map("n", "<Leader>duh", ":lua require('dap.ui.widgets').hover()<CR>")
     --       map("n", "<Leader>duf", ":lua local widgets=require('dap.ui.widgets');widgets.centered_float(widgets.scopes)<CR>")
     --       map("n", "<Leader>dro", ":lua local widgets=require('dap').repl.open()<CR>")
     --       map("n", "<Leader>drl", ":lua local widgets=require('dap').repl.run_last()<CR>")
     --       map("n", "<Leader>dbc", ":lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
     --       map("n", "<Leader>dbm", ":lua require('dap').set_breakpoint({ nil, nil, vim.fn.input('Log point message: ') })<CR>")
     --       map("n", "<Leader>dbt", ":lua require('dap').toggle_breakpoint()<CR>")
     --
     --       map("n", "<Leader>dc", ":lua require('dap.ui.variables').scopes()<CR>")
     --       map("n", "<Leader>di", ":lua require('dapui').toggle()<CR>")
     --     end,
     --
     -- },
     -- ["theHamsta/nvim-dap-virtual-text"] = {
     --     after = "vim-easymotion",
     -- },
     ["Pocco81/true-zen.nvim"] = {
         after = "vim-easymotion",
     },
     ["sainnhe/everforest"] = {},


}

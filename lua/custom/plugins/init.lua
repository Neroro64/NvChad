return {
      -- Overriding the default configs
      ["nvim-telescope/telescope.nvim"] = {
        setup = function()
           -- load default mappings first
           require("core.mappings").telescope()
           local map = nvchad.map
  
           -- then load your mappings
           map("n", "<leader>oi", "<cmd> :Telescope buffers <CR>")
           map("n", "<leader>of", "<cmd> :Telescope find_files <CR>")
           map("n", "<Nop>", "<cmd> :Telescope find_files follow=true no_ignore=true hidden=true <CR>")
           map("n", "<leader>ogc", "<cmd> :Telescope git_commits <CR>")
           map("n", "<leader>ogs", "<cmd> :Telescope git_status <CR>")
           map("n", "<leader>oh", "<cmd> :Telescope help_tags <CR>")
           map("n", "<leader>o/", "<cmd> :Telescope live_grep <CR>")
           map("n", "<leader>ou", "<cmd> :Telescope oldfiles <CR>")
           map("n", "<leader>oth", "<cmd> :Telescope themes <CR>")
           map("n", "<leader>och", "<cmd> :Telescope keymaps <CR>")
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
    ["numToStr/Comment.nvim"] = {
        setup = function()
            require("core.mappings").comment()
            local map = nvchad.map
            map("n", "<leader>cc", "<cmd> :lua require('Comment.api').toggle_current_linewise()<CR>")
            map("v", "<leader>cc", "<esc><cmd> :lua require('Comment.api').toggle_linewise_op(vim.fn.visualmode())<CR>")
        end,
    },
    ["neovim/nvim-lspconfig"] = {
        setup = function()
            require("core.mappings").lspconfig()
            local map = nvchad.map
            map("n", "<leader>ll", function()
                vim.diagnostic.setloclist()
            end)
        end,
    },
    ["akinsho/bufferline.nvim"] = {
        setup = function()
            require("core.mappings").bufferline()
            local map = nvchad.map
            map("n", "<leader>i", "<cmd> :BufferPick <CR>")
            map("n", "<leader>I", "<cmd> :BufferPickClose <CR>")
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
		after = "vim-easymotion",
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
		after = "vim-easymotion",
		config = function()
			require("custom.plugins.orgmode")
		end,
	},
	["luukvbaal/stabilize.nvim"] = {
		config = function() require("stabilize").setup() end
	},
	["ctrlpvim/ctrlp.vim"] = {
		after = "vim-easymotion",
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
	["liuchengxu/vista.vim"] = {
		after = "vim-easymotion",
	},
	["tpope/vim-fugitive"] = {
		after = "vim-easymotion",
	},
    ["sakhnik/nvim-gdb"] = {
		after = "vim-easymotion",
        config = function()
            local map = nvchad.map
            map("n", "<leader>bbt", "<cmd> :GdbBreakpointToggle <CR>")
            map("n", "<leader>bbu", "<cmd> :GdbUntil <CR>")
            map("n", "<leader>bbc", "<cmd> :GdbContinue <CR>")
            map("n", "<leader>bbn", "<cmd> :GdbNext <CR>")
            map("n", "<leader>bbs", "<cmd> :GdbStep <CR>")
            map("n", "<leader>bbf", "<cmd> :GdbFinish <CR>")
            map("n", "<leader>bbp", "<cmd> :GdbFrameUp <CR>")
            map("n", "<leader>bbP", "<cmd> :GdbFrameDown <CR>")
        end,
    },

  
}
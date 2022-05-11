-- Custom options
vim.opt.pumheight = 15  -- sets the pop up window height
vim.opt.so = 7 -- " Set 7 lines to the cursor - when moving vertically using j/k
vim.opt.wildignore = {
  '*.o' ,'*~','*.pyc','*.gch',
  '*.pch', '.git/', '.hg/', '.svn/',
  '.cache/', '.DS_Store/', '*.meta', '*.obj',
  '.vs/', '[Bb]uild/', '[Bb]in/', '*.exe',
  '*.out', '*.dll', '*.nfo', '*.pdb'
}
vim.opt.cursorline = true  -- Highlight current line
vim.opt.ffs = {'unix', 'dos', 'mac'} --  Use Unix as the standard file type

-- Custom mappings
local map = nvchad.map
map('n', 'vA', 'ggVG')  -- Select all text
map("n", "<C-a>c", "<cmd> :%y+ <CR>") -- copy whole file content
map("n", "<leader>tb", "<cmd> :enew <CR>") -- new buffer
map("n", "<leader>tt", "<cmd> :tabnew <CR>") -- new tabs
map("n", "<leader>w", "<cmd> :w <CR>") -- ctrl + s to save file
map("n", "<leader>q", "<cmd> :q <CR>") 

-- Switch between tabs
map('n', '<Leader>1', '1gt')
map('n', '<Leader>2', '2gt')
map('n', '<Leader>3', '3gt')
map('n', '<Leader>4', '4gt')
map('n', '<Leader>5', '5gt')
map('n', '<Leader>6', '6gt')
map('n', '<Leader>7', '7gt')
map('n', '<Leader>8', '8gt')
map('n', '<Leader>8', '8gt')
map('n', '<Leader>q', ':q<CR>')

-- Remap VIM 0 to first non-blank character, aka. press '0' to jump to the first character of current line
map('n', "0", '^')
map('v', "0", '^')

-- Move a line of text using ALT+[jk] or Command+[jk] on mac
map('n', '<A-j>', ":m .+1<CR>==")
map('n', '<A-k>', ":m .-2<CR>==")
map('i', '<A-j>', "<Esc>:m .+1<CR>==gi")
map('i', '<A-k>', "<Esc>:m .-2<CR>==gi")
map('v', '<A-j>', ":m '>+1<CR>gv=gv")
map('v', '<A-k>', ":m '<-2<CR>gv=gv")

-- Remove the Windows ^M - when the encodings gets messed up
map('n', '<Leader>dm', "mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm")

map('n', "<leader>%", "let @+ = expand('%:p') echo @+")

-- Perforce actions
map('n', "<leader>pe", ":!p4 edit -c default %:p <cr>")
map('n', "<leader>pc", ":!p4 edit %:p -c ")
map('n', "<leader>pr", ":!p4 revert %:p <cr>")

-- Tag bar
map('n', "<F9>", ":Vista<CR>")
-- Undotree
map('n', "<Leader>U", ":UndotreeToggle<CR>")

vim.cmd([[
  " Remap diffnext and diffprev
  nnoremap <expr> <C-J> &diff ? ']c' : '<C-W>j'
  nnoremap <expr> <C-K> &diff ? '[c' : '<C-W>k'

  " Copy current file path to clipboard
  nnoremap <leader>% :call CopyCurrentFilePath()<CR>
  function! CopyCurrentFilePath() " {{{
      let @+ = expand('%:p')
      echo @+
  endfunction

  " /foo<tab><tab><cr> to search and jump to the ones directly, with another word, you can use <tab> to jump between matches when typing in the search bar
  set wildcharm=<c-z>
  cnoremap <expr> <Tab>   getcmdtype() =~ '[?/]' ? "<c-g>" : "<c-z>"
  cnoremap <expr> <S-Tab> getcmdtype() =~ '[?/]' ? "<c-t>" : "<S-Tab>"

  " {
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
  " }
  " Start interactive EasyAlign in visual mode (e.g. vipga)
    xmap ga <Plug>(EasyAlign)

    " Start interactive EasyAlign for a motion/text object (e.g. gaip)
    nmap ga <Plug>(EasyAlign)

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


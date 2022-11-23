call plug#begin("~/.vim/plugged")
	" Plugin section
	
	" Theme
	Plug 'dracula/vim'
    Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
    Plug 'ellisonleao/gruvbox.nvim'

    " Tmux+Vim
    Plug 'christoomey/vim-tmux-navigator'
	
	" File Explorer
	Plug 'scrooloose/nerdtree'
	Plug 'ryanoasis/vim-devicons'
    Plug 'Xuyuanp/nerdtree-git-plugin'

	" File Searching
	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
	Plug 'junegunn/fzf.vim'
    Plug 'wookayin/fzf-ripgrep.vim'

	" Intellisense / Syntax Highlighting
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	let g:coc_global_extensions = [
        \ 'coc-emmet',
        \ 'coc-css',
        \ 'coc-html',
        \ 'coc-json',
        \ 'coc-prettier',
        \ 'coc-tsserver',
        \ 'coc-cmake',
        \ 'coc-pyright',
        \ 'coc-solargraph'
        \ ]

	" Misc
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'puremourning/vimspector'
	Plug 'preservim/nerdcommenter'
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'romgrk/barbar.nvim'
    Plug 'beauwilliams/statusline.lua'
    Plug 'tveskag/nvim-blame-line'
    Plug 'petertriho/nvim-scrollbar'
    Plug 'steelsojka/pears.nvim'
    Plug 'liuchengxu/vista.vim'
    Plug 'farmergreg/vim-lastplace'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-surround'
    Plug 'alvan/vim-closetag'
    Plug 'lambdalisue/suda.vim'

    " React/JS/TS Support
    Plug 'pangloss/vim-javascript'
    Plug 'leafgarland/typescript-vim'
    Plug 'peitalin/vim-jsx-typescript'

    " Ruby
    Plug 'nvim-lua/plenary.nvim'
    Plug 'vinibispo/ruby.nvim'
    Plug 'tpope/vim-rails'

    " C++
    Plug 'bfrg/vim-cpp-modern'
    Plug 'jackguo380/vim-lsp-cxx-highlight'

    " Rust
    Plug 'rust-lang/rust.vim'

    " Godot
    Plug 'habamax/vim-godot'

    " Yuck (eww DSL)
    Plug 'elkowars/yuck.vim'
    Plug 'gpanders/nvim-parinfer'
call plug#end()

" Config section
set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching 
set ignorecase              " case insensitive 
set mouse=v                 " middle-click paste with 
set hlsearch                " highlight search 
set incsearch               " incremental search
set tabstop=4               " number of columns occupied by a tab 
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set nowrap                  " Disable line wrapping
"set wildmode=longest,list   " get bash-like tab completions
set cc=80                  " set an 80 column border for good coding style
filetype plugin indent on   "allow auto-indenting depending on file type
syntax on                   " syntax highlighting
set mouse=a                 " enable mouse click
set clipboard=unnamedplus   " using system clipboard
filetype plugin on
set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim
set spell                 " enable spell check (may need to download language package)
set noswapfile            " disable creating swap file
" set backupdir=~/.cache/vim " Directory to store backup files.
set ruler                   " enable line and column display

" Make it easier to work with buffers
" http://vim.wikia.com/wiki/Easier_buffer_switching
set hidden
set confirm
set autowriteall
set wildmenu wildmode=full

" Set encoding for vim-devicons
set encoding=UTF-8

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Set shell to ZSH
set shell=zsh

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Theme
set notermguicolors
syntax enable
set background=dark
colorscheme gruvbox
hi Normal guibg=NONE ctermbg=NONE
hi NormalNC guibg=NONE ctermbg=NONE

" Fixes lag when exiting insert/visual mode
if !has('gui_running')
    set ttimeoutlen=10
    augroup FastEscape
        autocmd!
        autocmd InsertEnter * set timeoutlen=0
        autocmd InsertLeave * set timeoutlen=1000
    augroup end
endif

" NerdComment
let g:NERDSpaceDelims = 1       " add space after comment
let g:NERDCompactSexyComs = 1   " short syntax in comment blocks

" Tmux+Vim
let g:tmux_navigator_no_mappings = 1

" File Explorer
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''

" Auto start NERD tree when opening a directory
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | wincmd p | endif

" Auto start NERD tree if no files are specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | exe 'NERDTree' | endif

" Automatically close nvim if NERDTree is the only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Toggle NERDTree
nnoremap <silent> <C-b> :call NERDTreeToggleAndRefresh()<CR>

function NERDTreeToggleAndRefresh()
    :NERDTreeToggle
    if g:NERDTree.IsOpen()
        :NERDTreeRefreshRoot
    endif
endfunction

" Set NERDTreeGit nerd fonts
let g:NERDTreeGitStatusUseNerdFonts = 1

" Integrated Terminal
set splitright
set splitbelow

" Remap leader key
let mapleader=";"

" Keymappings
nnoremap <silent> <leader>n :set number! number?<CR>
nnoremap <silent> <leader>w :set wrap! wrap?<CR>

" Buffer stuff
" Swap between current and last buffer
nnoremap <silent> <leader>bb <C-^>
" go to next buffer
nnoremap <silent> <leader>bn :bn<CR>
nnoremap <C-l> :bn<CR>

" go to previous buffer
nnoremap <silent> <leader>bp :bp<CR>
nnoremap <C-h> :bp<CR>

" close buffer
nnoremap <silent> <leader>bd :bd<CR>

" kill buffer
nnoremap <silent> <leader>bk :bd!<CR>

" list buffers
nnoremap <silent> <leader>bl :ls<CR>
" list and select buffer
nnoremap <silent> <leader>bg :ls<CR>:buffer<Space>

" Horizontal split with new buffer
nnoremap <silent> <leader>bh :new<CR>
" Vertical split with new buffer
nnoremap <silent> <leader>bv :vnew<CR>

" Tab completion
inoremap <silent><expr> <TAB>
    \ coc#pum#visible() ? coc#pum#next(1) :
    \ CheckBackspace() ? "\<TAB>" :
    \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>

" Start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif

" Open terminal on Ctrl+N
function! OpenTerminal()
	split term://zsh
	resize 10
endfunction
nnoremap <C-n> :call OpenTerminal()<CR>


" Use Alt+[HJKL] to move between panels
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <silent> <A-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <A-j> :TmuxNavigateDown<cr>
nnoremap <silent> <A-k> :TmuxNavigateUp<cr>
nnoremap <silent> <A-l> :TmuxNavigateRight<cr>

" move line or visually selected block - alt+j/k
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi

" File Searching
nnoremap <C-p> :FZF<CR>
nnoremap <C-f> :RgFzf<CR>
let g:fzf_action = {
	\ 'ctrl-t': 'tab split',
	\ 'ctrl-s': 'split',
	\ 'ctrl-v': 'vsplit'
\}

let $FZF_DEFAULT_COMMAND = 'ag -g ""'

" CppMan setup
function! s:JbzCppMan()
    let old_isk = &iskeyword
    setl iskeyword+=:
    let str = expand("<cword>")
    let &l:iskeyword = old_isk
    execute 'Man ' . str
endfunction
command! JbzCppMan :call s:JbzCppMan()

au FileType cpp nnoremap <buffer>K :JbzCppMan<CR>

" Vista toggle
nnoremap <silent> <A-G> :Vista!!<CR>

" Enable nvim-blame-line
autocmd BufEnter * EnableBlameLine

" C++ Syntax Highlighting
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1

" Ruby / Rails Settings
autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2
autocmd FileType eruby setlocal expandtab shiftwidth=2 tabstop=2

" React stuff
" Enable code folding
augroup javascript_folding
    au!
    au FileType javascript setlocal foldmethod=syntax
augroup END

" Set file types for vim-jsx-typescript
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact

" Godot Settings
let g:godot_executable = '/home/anthony/.godot'

" vim-closetag
let g:closetag_filenames = '*.html,*.html.erb,*.xhtml,*.phtml'
let g:closetag_xhtml_filenames = '*.xhtml, *.js, *.jsx, *.tsx'
let g:closetag_filetypes = 'html,erb,xhtml,phtml'
let g:closetag_xhtml_filetypes = 'xhtml,jsx,js,tsx'
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ 'typescriptreact': 'jsxRegion,tsxRegion',
    \ 'javascriptreact': 'jsxRegion',
    \ }

" vimspector
let g:vimspector_sidebar_width = 85
let g:vimspector_bottombar_height = 15
let g:vimspector_terminal_maxwidth = 70

nnoremap <F5> :call vimspector#Launch()<cr>
nnoremap <F8> :call vimspector#Reset()<cr>
nnoremap <F10> :call vimspector#StepInto()<cr>")
nnoremap <F11> :call vimspector#StepOver()<cr>")
nnoremap <F12> :call vimspector#StepOut()<cr>")
nnoremap <silent> <leader>db :call vimspector#ToggleBreakpoint()<cr>")

" Lua-based plugin setup
" nvim-scrollbar
lua require("scrollbar").setup()

" pears.nvim
lua require("pears").setup()

" nvim-treesitter
lua << EOF
require("nvim-treesitter.configs").setup {
  ensure_installed = { "rust", "toml", "bash", "glsl", "html", "json", "python", "ruby", "tsx", "vim", "yaml" },
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting=false,
    },
  ident = { enable = true },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
    }
  }
EOF

" set folding using treesitter
" set foldmethod=expr
" set foldexpr=nvim_treesitter#foldexpr()

" Basic Config
set nu
set autochdir
set nocompatible
set cursorline
set showmatch
set backspace=indent,eol,start

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
set cinoptions+=g0
set clipboard=unnamedplus
set incsearch
set ignorecase

syntax enable
syntax on
filetype plugin indent on

let mapleader=" "

"""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.config/nvim/plugged')
"
" Syntax and Complete
Plug 'neoclide/coc.nvim',{'branch': 'release'}
"
" Align
Plug 'junegunn/vim-easy-align'
"
" Fold
Plug 'xaizek/preamble.vim'
"
" NERDTree
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
"
" Git
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
"
" TagBar need ctags
Plug 'majutsushi/tagbar'
"
" Vim status bar
Plug 'vim-airline/vim-airline'
"
" Color & theme
" colorscheme neodark
Plug 'KeitaNakamura/neodark.vim'
" colorscheme monokai
Plug 'crusoexia/vim-monokai'
" colorscheme one 
Plug 'rakr/vim-one'
"
" Golang
Plug 'fatih/vim-go', { 'tag': '*' }
"
" Rust
Plug 'rust-lang/rust.vim'
"
" C++
Plug 'bfrg/vim-cpp-modern'
"
" Lua
Plug 'rafcamlet/coc-nvim-lua'
"
" Quick Comment
Plug 'preservim/nerdcommenter'
"
" Snippets
Plug 'SirVer/ultisnips'
"
call plug#end()
"""""""""""""""""""""""""""""""""""""""""""""""""""

" Set Color and Theme
set termguicolors
colorscheme neodark

" Set Coc Highlight Color
hi CocHintSign  ctermfg=245 guifg=#658595

" Config Golang
let g:go_fmt_command = "goimports"
let g:go_autodetect_gopath = 1
let g:go_list_type = "quickfix"
let g:go_version_warning = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_methods = 1
let g:go_highlight_generate_tags = 1
let g:godef_split=2

" Config cpp
let g:cpp_namespace_highlight = 1
let g:cpp_member_highlight = 1
let g:cpp_attributes_highlight = 1
let g:cpp_simple_highlight = 1

" Config NERDTree
map <C-Left> :NERDTreeToggle<CR>
let g:NERDTreeWinSize = 25
let NERDTreeShowLineNumbers=1
let NERDTreeAutoCenter=1
let NERDTreeShowHidden=0
let NERDTreeIgnore=['\.pyc','\~$','\.swp']
let g:nerdtree_tabs_open_on_console_startup=1
" NERDTree logos
let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "✹",
	\ "Staged"    : "✚",
	\ "Untracked" : "✭",
	\ "Renamed"   : "➜",
	\ "Unmerged"  : "═",
	\ "Deleted"   : "✖",
	\ "Dirty"     : "✗",
	\ "Clean"     : "✔︎",
	\ 'Ignored'   : '☒',
	\ "Unknown"   : "?"
	\ }
let g:NERDTreeGitStatusShowIgnored = 1
" Switch tabs
:nn <Leader>1 1gt
:nn <Leader>2 2gt
:nn <Leader>3 3gt
:nn <Leader>4 4gt
:nn <Leader>5 5gt
:nn <Leader>6 6gt
:nn <Leader>7 7gt
:nn <Leader>8 8gt
:nn <Leader>9 9gt
:nn <Leader>0 :tablast<CR>

" Config TagBar
nmap <C-Right> :TagbarToggle<CR>
let g:tagbar_width = 25
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
	\ 'kinds'     : [
		\ 'p:package',
		\ 'i:imports:1',
		\ 'c:constants',
		\ 'v:variables',
		\ 't:types',
		\ 'n:interfaces',
		\ 'w:fields',
		\ 'e:embedded',
		\ 'm:methods',
		\ 'r:constructor',
		\ 'f:functions'
	\ ],
	\ 'sro' : '.',
	\ 'kind2scope' : {
		\ 't' : 'ctype',
		\ 'n' : 'ntype'
	\ },
	\ 'scope2kind' : {
		\ 'ctype' : 't',
		\ 'ntype' : 'n'
	\ },
	\ 'ctagsbin'  : 'gotags',
	\ 'ctagsargs' : '-sort -silent'
\ }

" Config Coc.nvim
" Coc.nvimcconfirm popup
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Switch .c & .h
nmap <silent> <C-s> :CocCommand clangd.switchSourceHeader<cr>
" Apply AutoFix to problem on the current line.
nmap <silent> <C-f> <Plug>(coc-fix-current)

" Config Comment
nnoremap <C-_> :call NERDComment(0,"toggle")<CR>
vnoremap <C-_> :call NERDComment(0,"toggle")<CR>

" Auto-Fold file headers
call Preamble#Enable('c,cc,cpp,h,go')
map <Leader>f   zf
map <Leader>o   zo

map <Leader><Left>  <C-w>h
map <Leader><Right> <C-w>l
map <Leader><Up>    <C-w>k
map <Leader><Down>  <C-w>j

map <Leader>s   :split<CR>
map <Leader>v   :vsplit<CR>

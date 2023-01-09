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

" define <Leader>
let mapleader=";" 

" v mode yy to system clipboard
vmap <Leader>c "+yy
" n mode yy to system clipboard
nmap <Leader>c "+yy
" n mode system clipboard paste
nmap <Leader>v "+p

set incsearch
set ignorecase
syntax enable
syntax on
filetype plugin indent on

au InsertLeave *.c,*.cpp,*.cc,*.h,*.go,*.sh,*.py,*.rs write

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
" vim status bar
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
colorscheme one

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

" Config NERDTree
map <C-Left> :NERDTreeToggle<CR>
let g:NERDTreeWinSize = 25
let NERDTreeShowLineNumbers=1
let NERDTreeAutoCenter=1
let NERDTreeShowHidden=0
let NERDTreeIgnore=['\.pyc','\~$','\.swp']
let NERDTreeShowBookmarks=2
let g:nerdtree_tabs_open_on_console_startup=1

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
:nn <Leader>9 8gt
:nn <Leader>0 :tablast<CR>

" Set coc.nvimcconfirm popup
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
" Code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Switch .c & .h
nmap <silent> <C-s> :CocCommand clangd.switchSourceHeader<cr>
" Apply AutoFix to problem on the current line.
nmap <silent> <C-f> <Plug>(coc-fix-current)

" Comment
nnoremap <C-_> :call nerdcommenter#Comment(0,"toggle")<CR>
vnoremap <C-_> :call nerdcommenter#Comment(0,"toggle")<CR>

" Auto-fold preambles
call Preamble#Enable('c,cc,cpp,h,go')

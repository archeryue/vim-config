" Basic Config
set number
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
Plug 'Xuyuanp/nerdtree-git-plugin'
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
noremap <C-Left> :NERDTreeToggle<CR>
let g:NERDTreeWinSize = 25
let NERDTreeShowLineNumbers=1
let NERDTreeAutoCenter=1
let NERDTreeShowHidden=0
let NERDTreeIgnore=['\.out','\.pyc','\~$','\.swp']
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
noremap <C-Right> :TagbarToggle<CR>
let g:tagbar_width = 25
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
	\ 'ctagsbin'  : 'gotags',
	\ 'ctagsargs' : '-sort -silent'
\ }

" Config Coc.nvim
" Coc.nvimcconfirm popup
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
" GoTo code navigation.
nnoremap <silent> gd <Plug>(coc-definition)
nnoremap <silent> gi <Plug>(coc-implementation)
nnoremap <silent> gr <Plug>(coc-references)
" Switch .c & .h
nnoremap <silent> <C-s> :CocCommand clangd.switchSourceHeader<cr>
" Apply AutoFix to problem on the current line.
nnoremap <silent> <C-f> <Plug>(coc-fix-current)

" Config EasyAlign
nnoremap ga <Plug>(EasyAlign)
vnoremap ga <Plug>(EasyAlign)

" Config Comment
nnoremap <C-_> :call NERDComment(0,"toggle")<CR>
vnoremap <C-_> :call NERDComment(0,"toggle")<CR>

" Config Fold
call Preamble#Enable('c,cc,cpp,h,hpp,go,rs')
noremap <Leader>f   zf
noremap <Leader>o   zo

" Config windows-switch
noremap <Leader><Left>  <C-w>h
noremap <Leader><Right> <C-w>l
noremap <Leader><Up>    <C-w>k
noremap <Leader><Down>  <C-w>j

" Config windows-split
noremap <silent><Leader>s   :split<CR>
noremap <silent><Leader>v   :vsplit<CR>

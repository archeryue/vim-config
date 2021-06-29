"====================================================================
" vim 内置配置 
"====================================================================

" 设置切换当前目录
set autochdir

" 关闭兼容模式
set nocompatible

set nu " 设置行号
set cursorline "突出显示当前行
" set cursorcolumn " 突出显示当前列
set showmatch " 显示括号匹配
set backspace=indent,eol,start

" tab 缩进
set tabstop=4 " 设置Tab长度为4空格
set shiftwidth=4 " 设置自动缩进长度为4空格
set autoindent " 继承前一行的缩进方式，适用于多行注释

" 定义快捷键的前缀，即<Leader>
let mapleader=";" 

" ==== 系统剪切板复制粘贴 ====
" v 模式下复制内容到系统剪切板
vmap <Leader>c "+yy
" n 模式下复制一行到系统剪切板
nmap <Leader>c "+yy
" n 模式下粘贴系统剪切板的内容
nmap <Leader>v "+p

" 开启实时搜索
set incsearch
" 搜索时大小写不敏感
set ignorecase
syntax enable
syntax on                    " 开启文件类型侦测
filetype plugin indent on    " 启用自动补全

" 退出插入模式指定类型的文件自动保存
au InsertLeave *.c,*.cpp,*.cc,*.h,*.go,*.sh,*.py write

" 插件开始的位置
call plug#begin('~/.vim/plugged')
"
" 补全
Plug 'neoclide/coc.nvim',{'branch': 'release'}
"
" 可以快速对齐的插件
Plug 'junegunn/vim-easy-align'
"
" NERDTree
Plug 'scrooloose/nerdtree'
"
" 可以使 nerdtree 的 tab 更加友好些
Plug 'jistr/vim-nerdtree-tabs'
"
" 可以在导航目录中看到 git 版本信息
Plug 'Xuyuanp/nerdtree-git-plugin'
"
" 查看当前代码文件中的变量和函数列表的插件，
" 可以切换和跳转到代码中对应的变量和函数的位置
" need ctags
Plug 'majutsushi/tagbar'
"
" Vim状态栏插件，包括显示行号，列号，文件类型，文件名，以及Git状态
Plug 'vim-airline/vim-airline'
"
" 可以在文档中显示 git 信息
Plug 'airblade/vim-gitgutter'
"
" 配色方案
" colorscheme neodark
Plug 'KeitaNakamura/neodark.vim'
" colorscheme monokai
Plug 'crusoexia/vim-monokai'
" colorscheme github 
Plug 'acarapetis/vim-colors-github'
" colorscheme one 
Plug 'rakr/vim-one'
"
" go 主要插件
Plug 'fatih/vim-go', { 'tag': '*' }
" go 中的代码追踪 gd
Plug 'dgryski/vim-godef'
"
" c++ plugin
Plug 'bfrg/vim-cpp-modern'
"
" Markdown
Plug 'iamcco/mathjax-support-for-mkdp'
Plug 'iamcco/markdown-preview.vim'
"
" 插件结束的位置，插件全部放在此行上面
call plug#end()
"====================================================================
" 主题配色 
"====================================================================

" 开启24bit的颜色，开启这个颜色会更漂亮一些
set termguicolors
" 配色方案, 可以从上面插件安装中的选择一个使用 
colorscheme one " 主题
set background=dark " 主题背景 dark-深色; light-浅色


"====================================================================
" vim-go 插件
"====================================================================
let g:go_fmt_command = "goimports" " 格式化将默认的 gofmt 替换
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


"====================================================================
" NERDTree 插件
"====================================================================

" 打开和关闭NERDTree快捷键
map <C-Left> :NERDTreeToggle<CR>
let g:NERDTreeWinSize = 25
" 显示行号
let NERDTreeShowLineNumbers=1
" 打开文件时是否显示目录
let NERDTreeAutoCenter=1
" 是否显示隐藏文件
let NERDTreeShowHidden=0
" 设置宽度
" let NERDTreeWinSize=31
" 忽略一下文件的显示
let NERDTreeIgnore=['\.pyc','\~$','\.swp']
" 打开 vim 文件及显示书签列表
let NERDTreeShowBookmarks=2

" 在终端启动vim时，共享NERDTree
let g:nerdtree_tabs_open_on_console_startup=1


"====================================================================
"  majutsushi/tagbar 插件
"====================================================================

" majutsushi/tagbar 插件打开关闭快捷键
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


"====================================================================
"  nerdtree-git-plugin 插件
"====================================================================
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

"
" tab 标签页切换快捷键
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

" coc.nvimcconfirm popup
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" switch .c & .h
nmap <silent> <C-a> :CocCommand clangd.switchSourceHeader<cr>

" Markdown
nmap <silent> <C-m> <Plug>MarkdownPreview

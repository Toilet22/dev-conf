""检测操作系统
if(has("win32") || has("win95") || has("win64") || has("win16"))
  let g:iswindows=1
else
  let g:iswindows=0
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"F1-F10快捷键绑定
"<F4>在python文件添加头部
"<F8>自动使用autopep8格式化当前文件
"<F9> toggle location list
"<F10>无须重启即使vimrc配置生效
"<F11>添加helptags帮助文档
"<F12>generate ctags for current folder
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"<F4> 添加头部作者等信息
nmap <F4> :call SmartAddHeader()<cr>
function! SmartAddHeader()
    if &filetype=="python"
        normal gg
        normal O
        normal O
        call setline(1, "# -*- coding: utf-8 -*-")
        normal 3j
    endif
endf

"<F8>  vim-autopep8
autocmd FileType python map <buffer> <F8> :call Autopep8()<CR><C-l><CR>

"<F9>  toggle location list
function! ToggleErrors()
    let old_last_winnr = winnr('$')
    lclose
    if old_last_winnr == winnr('$')
        " Nothing was closed, open syntastic error location panel
        Errors
    endif
endfunction
map <F9> :call ToggleErrors()<CR>

"<F10> 改变.vimrc后无须重启vi即生效
map <F10> :w<cr>:so %<cr>

map <F11> :helptags ~/.vim/doc<cr>

" map F12 to generate ctags for current folder:
map <F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Other shortcuts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"leader
inoremap jk <Esc>
let mapleader=","


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 外观设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" startup windows size
"set lines=50 columns=108

" syntax
syntax enable
syntax on
" colors
colorscheme torte

" 设置行间距
" font
if g:iswindows
    set linespace=1
    set guifont=Lucida\ Console:h13
    "set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h12
else
    set guifont=Monaco\ for\ Powerline:h16
endif

" 下面5行用来解决gVim菜单栏和右键菜单乱码问题
set encoding=utf8
set langmenu=zh_CN.UTF-8
set imcmdline
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

set guioptions-=m "不显示菜单.
set guioptions-=T "不显示工具栏
" 解决gVim中提示框乱码
language message zh_CN.UTF-8

" 设定默认解码
set fileencodings=utf-8,usc-bom,euc-jp,gb18030,gbk,gb2312,cp936

" 不要使用vi的键盘模式，而是vim自己的
set nocompatible
" history文件中需要记录的行数
set history=100

" 在处理未保存或只读文件的时候，弹出确认
set confirm

" 为特定文件类型载入相关缩进文件
filetype indent on
" 保存全局变量
set viminfo+=!

" 带有如下符号的单词不要被换行分割
set iskeyword+=_,$,@,%,#,-

set colorcolumn=100

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 文件设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" filetype
filetype on
filetype plugin on

set fileformat=unix

" 不备份，不生成临时文件
set nobackup
set nowritebackup
set noswapfile
" 当buffer被丢弃的时删除它
set bufhidden=hide

" 增强模式中的命令行自动完成操作
set wildmenu

" 在状态行上显示光标所在位置的行号和列号
set ruler
set rulerformat=%20(%2*%<%f%=\ %m%r\ %3l\ %c\ %p%%%)

" 使回格键（backspace）正常处理indent, eol, start等
set backspace=2

" 允许backspace和光标键跨越行边界
set whichwrap+=<,>,h,l

" 可以在buffer的任何地方使用鼠标（类似office中在工作区双击鼠标定位）
"set mouse=a
set selection=inclusive
set selectmode=key

" 启动的时候不显示那个援助索马里儿童的提示
set shortmess=atI
" 通过使用: commands命令，告诉我们文件的哪一行被改变过
set report=0

" 不让vim发出讨厌的滴滴声
"set noerrorbells

" 在被分割的窗口间显示空白，便于阅读
set fillchars=vert:\ ,stl:\ ,stlnc:\

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 搜索和匹配
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 高亮显示匹配的括号
set showmatch

" 匹配括号高亮的时间（单位是十分之一秒）
set matchtime=2

" 在搜索的时候忽略大小写
set ignorecase

" 不要高亮被搜索的句子（phrases）
set hlsearch

" 在搜索时，输入的词句的逐字符高亮（类似firefox的搜索）
set incsearch

" 输入:set list命令是应该显示些啥？
set listchars=tab:\|\ ,trail:.,extends:>,precedes:<,eol:$

" 光标移动到buffer的顶部和底部时保持3行距离
set scrolloff=3

" 不要闪烁
set novisualbell

" statusline
"set statusline=\ %F%m%r%h%w\ %=\ [pos:%l:%v:%p%%]\ [%{&ff}\ %{&fenc!=''?&fenc:&enc}]\ \ [type:%Y]\ \

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 文本格式和排版
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 自动格式化
set formatoptions=tcrqn

" 继承前一行的缩进方式，特别适用于多行注释
set autoindent
" 为C程序提供自动缩进
set smartindent
"cindent:Vim可以很好的识别出C和Java等结构化程序设计语言，
"并且能用C语言的缩进格式来处理程序的缩进结构
set cindent

"设置Tab
set expandtab       " Use space to replace tab
set shiftwidth=4    " Auto indent width
set smarttab
set tabstop=4

" 自动折行显示(只是显示)
set wrap

" vimdiff忽略行尾的空格(自然包括全空格的行)
set diffopt+=iwhite

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Autocommands
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"保证工作目录为当前目录,
autocmd BufEnter * execute ":silent! lcd " . expand("%:p:h")

" 只在下列文件类型被侦测到的时候显示行号，普通文本文件不显示
if has("autocmd")
autocmd FileType xml,html,c,cs,java,perl,shell,bash,cpp,python,vim,php,ruby set number
endif " end has("autocmd")

" 能够漂亮地显示.NFO文件
set encoding=utf-8 fileencodings=ucs-bom,utf-8,gbk,cp936
function! SetFileEncodings(encodings)
    let b:myfileencodingsbak=&fileencodings
    let &fileencodings=a:encodings
endfunction
function! RestoreFileEncodings()
    let &fileencodings=b:myfileencodingsbak
    unlet b:myfileencodingsbak
endfunction

au BufReadPre *.nfo call SetFileEncodings('cp437')|set ambiwidth=single
au BufReadPost *.nfo call RestoreFileEncodings()

" 用空格键来开关折叠
set foldenable
set foldmethod=manual
autocmd FileType python setlocal foldmethod=indent
set foldlevel=99
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>

" auto remove trailing whitespace
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

""""""""""""""""""""""插件开始""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""
""ctag
" add current directory's generated tags file to available tags
set tags+=./tags
"""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""
""Taglist
let Tlist_Show_One_File = 1            "不同时显示多个文件的tag，只显示当前文件的
let Tlist_Exit_OnlyWindow = 1          "如果taglist窗口是最后一个窗口，则退出vim
"""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""
""zencoding
let g:user_zen_expandabbr_key = '<c-e>'
let g:use_zen_complete_tag = 1
"""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""
""Neosnippet自动补全
"Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

"Tab to select the next field to fill in the snippet.
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
            \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" -----------start use Honza's Snippets-----------
" Enable snipMate compatibility feature.
let g:neosnippet#disable_runtime_snippets = {'_': 1}
let g:neosnippet#enable_snipmate_compatibility = 1
if g:iswindows==1
    let g:neosnippet#snippets_directory="$VIM/vimfiles/bundle/vim-snippets/snippets"
else
    let g:neosnippet#snippets_directory="$HOME/.vim/vimfiles/bundle/vim-snippets/snippets"
endif
" -----------end use Honza's Snippets-----------

let g:snips_author='GitFree'

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

let g:vimrc_author='GitFree'
let g:vimrc_email='pengzhao.lh@gmail.com'
"""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""
""markdown
let g:vim_markdown_folding_disabled=1
"""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""
""syntastic
let g:syntastic_python_checkers = ['flake8', 'pyflakes']
let g:syntastic_python_flake8_args="--ignore=E501,E265,F403,E402"
"""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""
""neocomplete
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

"""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""
""jedi-vim
" If you are a person who likes to use VIM-buffers not tabs
let g:jedi#use_tabs_not_buffers = 0
" disable docstrings popup
autocmd FileType python setlocal completeopt-=preview

" use neocomplcache with jedi-vim
autocmd FileType python setlocal omnifunc=jedi#completions
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
let g:jedi#smart_auto_mappings = 0
if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.python =
            \ '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'
let g:jedi#popup_on_dot = 1
let g:jedi#popup_select_first = 0
"""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""
""air-line
""air-line
set laststatus=2
set t_Co=256
" set fileformat=unix
set encoding=utf-8

" font
" set guifont=Droid\ Sans\ Mono\ for\ Powerline

" let g:airline_theme="luna"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_powerline_fonts = 0

" configure whether buffer numbers should be shown.
let g:airline#extensions#tabline#buffer_nr_show = 1
" configure the formatting of filenames (see |filename-modifiers|)
let g:airline#extensions#tabline#fnamemod = ':p:t'
" unicode symbols
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '<U+1F512>'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.whitespace = 'Ξ'

"""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""
""Fuzzyfinder
nmap zf :FufFile<CR>
nmap zb :FufBuffer<CR>
"""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""
""json-vim
let g:vim_json_syntax_conceal = 0
"""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""
""vim-autopep8
let g:autopep8_disable_show_diff=1
let g:autopep8_max_line_length=120
"""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""
""vim-bookmarks
let g:bookmark_sign = '>>'
let g:bookmark_annotation_sign = '##'
"""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""
""vim-virtualenv
let g:virtualenv_auto_activate = 1
"""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""
""nerdtree
map <C-n> :NERDTreeToggle<CR>
" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
"""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""
""vim-easymotion
map <Leader> <Plug>(easymotion-prefix)

map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)

let g:EasyMotion_smartcase = 1
let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion
"""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""
""PreserveNoEOL
let g:PreserveNoEOL = 1
"""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""
""vundle
set nocompatible      " be iMproved
filetype off          " required!

if g:iswindows==1
    set rtp+=$VIM/vimfiles/bundle/vundle/
    call vundle#rc('$VIM/vimfiles/bundle/')
else
    " set the runtime path to include Vundle and initialize
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()
    " alternatively, pass a path where Vundle should install plugins
    "call vundle#begin('~/some/path/here')
endif

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" original repos on github
Plugin 'bling/vim-airline'
Plugin 'plasticboy/vim-markdown'
Plugin 'scrooloose/nerdcommenter'
Plugin 'davidhalter/jedi-vim'
Plugin 'Shougo/neocomplete.vim'
Plugin 'Shougo/neosnippet'
Plugin 'honza/vim-snippets'
Plugin 'scrooloose/syntastic'
Bundle 'vim-scripts/FuzzyFinder'
Plugin 'hynek/vim-python-pep8-indent'
Plugin 'tell-k/vim-autopep8'
Plugin 'elzr/vim-json'
Plugin 'MattesGroeger/vim-bookmarks'
Plugin 'dyng/ctrlsf.vim'
Plugin 'gitfree/vim-virtualenv'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'easymotion/vim-easymotion'
Plugin 'tpope/vim-fugitive'
Plugin 'henrik/vim-indexed-search'
Plugin 'editorconfig/editorconfig-vim'

" vim-scripts repos on vim.org
Plugin 'L9'
Plugin 'colorizer'
Plugin 'LargeFile'
Plugin 'PreserveNoEOL'

" git repos on your local machine (ie. when working on your own plugin)
call vundle#end()
filetype plugin indent on     " required!
"""""""""""""""""""""""""""""""""""""""""

" highlight 要放到airline后面, 否则被airline覆盖
highlight WarningMsg term=standout ctermfg=5 guifg=Red

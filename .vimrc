set nocompatible        " be iMproved 
filetype off            " required

" 快捷键前缀
let g:mapleader = ';'


" let Vundle manage Vundle
" required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

""""""""""""""""""""""""""""""""""""""""""
"   以下是Github上托管的插件
""""""""""""""""""""""""""""""""""""""""""

" tagbar插件及配置
Bundle 'majutsushi/tagbar'
nmap <Leader>tb :TagbarToggle<CR>		" 快捷键设置
map <F8> :Tagbar<CR>                    " F8快捷启动
"autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx call tagbar#autoopen()  "如果是c语言的程序的话，tagbar自动开启

" 文件树插件及配置
Bundle 'scrooloose/nerdtree'
let NERDTreeWinPos='left'
let NERDTreeWinSize=30
nmap <Leader>tr :NERDTreeToggle<CR>		" 快捷键设置
map <F10> :NERDTreeToggle<CR>

" 状态栏插件及配置
Bundle 'bling/vim-airline'
set laststatus=2

" 主题插件
Bundle "altercation/vim-colors-solarized"

" 给匹配的括号着色
Bundle 'kien/rainbow_parentheses.vim'
autocmd VimEnter * RainbowParenthesesActivate
autocmd Syntax * RainbowParenthesesLoadRound
autocmd Syntax * RainbowParenthesesLoadSquare
autocmd Syntax * RainbowParenthesesLoadBraces

" 语法检查
Bundle 'scrooloose/syntastic'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1 
let g:syntastic_cpp_include_dirs = ['/usr/include/']
let g:syntastic_cpp_remove_include_errors = 1
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = '-std=c++11 '
" set error or warning signs
let g:syntastic_error_symbol = 'X'
let g:syntastic_warning_symbol = '>>'
"whether to show balloons
let g:syntastic_enable_balloons = 1


" YCM插件及配置
Bundle 'Valloric/YouCompleteMe'
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
"在注释输入中也能补全
let g:ycm_complete_in_comments = 1
"在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
"注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0
"与ultisnips不冲突
let g:ycm_key_list_select_completion = ['<c-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']
"
let g:ycm_confirm_extra_conf = 0
let g:ycm_add_preview_to_completeopt = 1
"let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
" 快捷键
nmap <leader>gl :YcmCompleter GoToDeclaration<CR>
nmap <leader>gf :YcmCompleter GoToDefinition<CR>
nmap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
nmap <F4> :YcmDiags<CR>

" shift + tab 跳出括号
Bundle 'Raimondi/delimitMate'


""""""""""""""""""""""""""""""""""""""""""
"   以下是vim-scripts上的插件
""""""""""""""""""""""""""""""""""""""""""

" taglist插件及配置
Bundle 'taglist.vim'
let Tlist_Ctags_Cmd='ctags'
let Tlist_Show_One_File=1      " 不同事显示多个文件的tag，只显示当前文件的
let Tlist_WinWidt=28           " 设置taglist的宽度
let Tlist_Exit_OnlyWindow=1    " 如果taglist是最后一个窗口，则退出vim
let Tlist_Use_Right_Window=1   " 在右侧窗口显示taglist窗口
"let Tlist_Use_left_Window=1   " 在左侧窗口显示taglist窗口
nmap <Leader>tl :TlistToggle<CR>		" 快捷键设置
map <silent> <F9> :TlistToggle<cr> 

" C/H文件切换插件配置
Bundle 'a.vim'
nmap <Leader>a :A<CR>		" 快捷键设置
nnoremap <silent> <F2> :A<CR>


filetype plugin indent on     " required!
"
" Brief help
":BundleList          - list configured bundles
":BundleInstall(!)    - install(update) bundles
":BundleSearch(!) foo - search(or refresh cache first) for foo
":BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..


" other config
set nu
set cursorcolumn
set cursorline              " 突出显示当前行
set shiftwidth=4
set shiftround
set tabstop=4
set softtabstop=4
set smarttab
set expandtab

set encoding=utf-8

" 设置主题颜色
syntax enable
syntax on
set smartindent
set autoindent
set showmatch


" gui detect
if has('gui_running')
	let g:isGui = 1
else
	let g:isGui = 0
endif

" Set extra options when running in GUI mode
if g:isGui
	if g:isWin
		set guifont=Consolas:h14
	else
		set guifont=Monaco:h14
	endif
	set guioptions-=T
	set guioptions+=e
	set guioptions-=r
	set guioptions-=L
	set guitablabel=%M\ %t
	set showtabline=1
	set linespace=2
	set noimd
	set t_Co=256
endif

colorscheme solarized
set background=dark
set t_Co=256

" 设置标记一列的背景颜色和数字一行颜色一致
hi! link SignColumn   LineNr
hi! link ShowMarksHLl DiffAdd
hi! link ShowMarksHLu DiffChange

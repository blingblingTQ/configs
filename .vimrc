set nocompatible        " be iMproved 
filetype off            " required

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
let g:tagbar_ctags_bin='ctags'			" ctags程序的路径
let g:tagbar_width=30					" 窗口宽度的设置
map <F8> :Tagbar<CR>                    " F8快捷启动
"autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx call tagbar#autoopen()  "如果是c语言的程序的话，tagbar自动开启

" 文件树插件及配置
Bundle 'scrooloose/nerdtree'
let NERDTreeWinPos='left'
let NERDTreeWinSize=30
map <F10> :NERDTreeToggle<CR>

" 状态栏插件及配置
Bundle 'bling/vim-airline'
set laststatus=2

" 主题插件
Bundle "altercation/vim-colors-solarized"

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

" C/H文件切换插件配置
Bundle 'a.vim'
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
set ts=4
set nu
set cursorcolumn
set cursorline              " 突出显示当前行

" 设置主题颜色
syntax enable
syntax on


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

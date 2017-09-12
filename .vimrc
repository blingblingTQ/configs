let g:mapleader = ' '

" Vundle {
    set nocompatible        " be iMproved 
    filetype off            " required

    " set the runtime path to include Vundle and initialize
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()
    " alternatively, pass a path where Vundle should install plugins
    "call vundle#begin('~/some/path/here')

    " let Vundle manage Vundle, required
    Plugin 'VundleVim/Vundle.vim'              "vundle
"    Plugin 'altercation/vim-colors-solarized'  "solarized主题
    Plugin 'morhetz/gruvbox'                   "gruvbox主题
    Plugin 'scrooloose/nerdtree'               "文件树
    Plugin 'majutsushi/tagbar'                 "tagbar
    Plugin 'vim-airline/vim-airline'           "状态栏
    Plugin 'vim-airline/vim-airline-themes'    "状态栏主题
    Plugin 'ctrlpvim/ctrlp.vim'                "文件模糊查找
    Plugin 'tpope/vim-surround'                "括号匹配
    Plugin 'jiangmiao/auto-pairs'              "括号配对
    Plugin 'mileszs/ack.vim'                   "全局搜索
    Plugin 'luochen1990/rainbow'               "匹配括号着色
    Plugin 'easymotion/vim-easymotion'         "快速跳转
    Plugin 'nathanaelkane/vim-indent-guides'   "可视化缩进
    Plugin 'scrooloose/syntastic'              "语法检查
    Plugin 'Valloric/YouCompleteMe'            "YCM补全
    Plugin 'scrooloose/nerdcommenter'          "批量注释
    Plugin 'godlygeek/tabular'                 "Tab对齐
    Plugin 'Raimondi/delimitMate'              "shift+tab跳出括号


    " [NERDTree]
    let NERDTreeWinPos = 'left'
    let NERDTreeWinSize = 30
    map <F2> :NERDTreeToggle<CR>
    " [NERDTree]$
    

    " [Tagbar]
    let g:tagbar_ctags_bin='/usr/local/bin/ctags'
    nmap <Leader>tb :TagbarToggle<CR>
    map <F3> :Tagbar<CR>
    "autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx call tagbar#autoopen()
    ""如果是c语言的程序的话，tagbar自动开启
    " [Tagbar]$


    " [vim-airline]
    let g:airline_powerline_fonts = 1

    "打开tabline功能,方便查看Buffer和切换,省去了minibufexpl插件
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#buffer_nr_show = 1
    
    "设置切换Buffer快捷键"
    nmap <leader>bn :bnext<CR>
    nmap <leader>bp :bprevious<CR>
    " 关闭状态显示空白符号计数
    let g:airline#extensions#whitespace#enabled = 0
    let g:airline#extensions#whitespace#symbol = '!'
    if !exists('g:airline_symbols')
        let g:airline_symbols = {}
    endif

    let g:airline_left_sep = '»'
    let g:airline_left_sep = '▶'
    let g:airline_right_sep = '«'
    let g:airline_right_sep = '◀'
    let g:airline_symbols.crypt = '🔒'
    let g:airline_symbols.linenr = '☰'
    let g:airline_symbols.linenr = '␊'
    let g:airline_symbols.linenr = '␤'
    let g:airline_symbols.linenr = '¶'
    let g:airline_symbols.maxlinenr = ''
    let g:airline_symbols.maxlinenr = '㏑'
    let g:airline_symbols.branch = '⎇'
    let g:airline_symbols.paste = 'ρ'
    let g:airline_symbols.paste = 'Þ'
    let g:airline_symbols.paste = '∥'
    let g:airline_symbols.spell = 'Ꞩ'
    let g:airline_symbols.notexists = '∄'
    let g:airline_symbols.whitespace = 'Ξ'
    " [vim-airline]$

    " [vim-airline-theme]
    let g:airline_theme='badwolf'
    " [vim-airline-theme]$


    " [ctrlp]
    let g:ctrlp_map = '<leader>f'
    let g:ctrlp_match_window_reversed = 0
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.vscode/*
    let g:ctrlp_open_multiple_files = 'v'
    let g:ctrlp_reuse_window = 'netrw\|help\|quickfix'
    if executable('ag')
        " Use ag over grep
        set grepprg=ag\ --nogroup\ --nocolor
        " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
        let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
        " ag is fast enough that CtrlP doesn't need to cache
        let g:ctrlp_use_caching = 0
    endif
    " [ctrlp]$


    " [vim-ack]
    " [vim-ack]$


    " [rainbow]
    let g:rainbow_active = 1
    let g:rainbow_conf = {
        \    'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
        \    'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
        \    'operators': '_,_',
        \    'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
        \    'separately': {
        \        '*': {},
        \        'tex': {
        \            'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
        \        },
        \        'lisp': {
        \            'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
        \        },
        \        'vim': {
        \            'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
        \        },
        \        'html': {
        \            'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
        \        },
        \        'css': 0,
        \    }
        \}
    " [rainbow]$


    "[ident-guides]
    let g:indent_guides_enable_on_vim_startup = 0  " 默认关闭
    let g:indent_guides_guide_size = 1  " 指定对齐线的尺寸
    let g:indent_guides_start_level = 2  " 从第二层开始可视化显示缩进
    :nmap <Leader>i : IndentGuidesToggle<CR>
    "[ident-guides]$


    " [syntastic]
    nmap <leader>ss :SyntasticToggleMode<CR>
    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_open = 0
    let g:syntastic_cpp_include_dirs = ['/usr/include/']
    let g:syntastic_cpp_remove_include_errors = 1
    let g:syntastic_cpp_check_header = 1
    let g:syntastic_cpp_compiler = 'clang++'
    let g:syntastic_cpp_compiler_options = '-std=c++1z '
    let g:syntastic_error_symbol = '✗'
    let g:syntastic_warning_symbol = '⚠'
    let g:syntastic_enable_balloons = 1
    " [syntastic]$

    " [YouCompleteMe]
    let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
    let g:ycm_complete_in_comments = 1
    let g:ycm_complete_in_strings = 1
    let g:ycm_collect_identifiers_from_comments_and_strings = 0
    let g:ycm_confirm_extra_conf = 0
    let g:ycm_add_preview_to_completeopt = 1
    "let g:ycm_autoclose_preview_window_after_completion = 1
    let g:ycm_autoclose_preview_window_after_insertion = 1
    "let g:ycm_show_diagnostics_ui = 0

    " for compatibility with ultisnips plugin
    let g:ycm_key_list_select_completion = ['<c-n>', '<Down>']
    let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']
    " [YouCompleteMe]$


    " [tabular]
    " ,bb  按=号对齐代码 [Tabular插件]
    nmap <leader>t :Tab /=<CR>
    " [tabular]%
    

    " [nerdcommenter]
    " default <leader>cc : 添加注释
    " default <leader>cu : 删除注释
    " [nerdcommenter]%


    " All of your Plugins must be added before the following line
    call vundle#end()            " required
    filetype plugin indent on    " required
    " To ignore plugin indent changes, instead use:
    "filetype plugin on
    "
    "Brief help
    " :PluginList       - lists configured plugins
    " :PluginInstall    - installs plugins; append `!` to update or just
    " :PluginUpdate
    " :PluginSearch foo - searches for foo; append `!` to refresh local
    " cache
    " :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
    "
    " see :h vundle for more details or wiki for FAQ
    " Put your non-Plugin stuff after this line
" }


" Vim {
    " search
    set hlsearch
    set incsearch
    set ignorecase
    set smartcase

    " tab
    set shiftwidth=4
    set shiftround
    set tabstop=4
    set softtabstop=4
    set smarttab
    set expandtab

    " indent
    set smartindent
    set autoindent

    set nocompatible
    set backspace=indent,eol,start
    
    " highlight
    syntax enable
    set background=dark
    colorscheme gruvbox
   
    " line number
    set number
    set relativenumber

    " vim encoding
    set encoding=utf-8

    " command line completion
    set wildmenu

    " fold
    set foldenable
    set foldmethod=manual

    " cursor
    set scrolloff=3
" }

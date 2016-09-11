filetype plugin indent on
syntax on

" indent
set shiftwidth=2
set softtabstop=2
set tabstop=2
set autoindent
set expandtab

" wrap
let &showbreak='↳ '
set breakindent
set linebreak
set wrap

" search
set ignorecase
set incsearch
set smartcase

" backup
set nobackup
set noswapfile
set nowritebackup

" statusline
set laststatus=0
set ruler
set showmode
set wildmenu

" buffer
set autoread
set hidden
set encoding=utf-8

" state
set viminfo^=%
set undolevels=1000
set history=1000
set clipboard+=unnamedplus
set sessionoptions-=options

" behavior
let mapleader = ' '
set backspace=2
set scrolloff=5
set mouse=a
set splitbelow
set path+=**

" theme
set background=dark
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
"set termguicolors

" faster display
set lazyredraw
set ttyfast

" bell
set visualbell
set t_vb=

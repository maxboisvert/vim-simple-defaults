if exists("g:loaded_vim_simple_defaults")
  finish
endif
let g:loaded_vim_simple_defaults = 1

let g:vsd_tab_length = get(g:, 'vsd_tab_length', 4)

filetype plugin indent on
syntax on

" indent
let &shiftwidth=g:vsd_tab_length
let &softtabstop=g:vsd_tab_length
let &tabstop=g:vsd_tab_length
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
set hlsearch
if executable('ag')
    let &grepprg = 'ag --vimgrep'
endif

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
set clipboard^=unnamedplus,unnamed
set sessionoptions-=options

" behavior
let mapleader = ' '
set backspace=2
set scrolloff=5
set complete-=i
set mouse=a
set wildignore+=*.swp,*.bak,*.pyc,*.class,*.jar,*.gif,*.png,*.jpg,*.svg
set path+=**

" theme
set background=dark
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
set termguicolors

" faster display
set lazyredraw
set ttyfast

" bell
set visualbell
set t_vb=

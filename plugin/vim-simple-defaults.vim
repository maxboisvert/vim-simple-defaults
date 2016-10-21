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
set hlsearch
set ignorecase
set incsearch
set smartcase
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
set encoding=utf-8
set hidden

" state
set clipboard^=unnamedplus,unnamed
set history=1000
set sessionoptions-=options
set undolevels=1000
set viminfo^=%

" behavior
let mapleader = ' '
set backspace=2
set complete-=i
set complete-=t
set mouse=a
set path+=**
set scrolloff=5
set wildignore+=*.swp,*.bak,*.pyc,*.class,*.jar,*.gif,*.png,*.jpg,*.svg

" theme
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
set background=dark
set termguicolors

" faster display
set lazyredraw
set ttyfast

" bell
set t_vb=
set visualbell

" mappings
nnoremap j gj
nnoremap k gk

" autocommands
autocmd BufEnter * silent! normal! g`"
autocmd CursorHold * checktime

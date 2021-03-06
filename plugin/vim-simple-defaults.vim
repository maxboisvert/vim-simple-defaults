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

" display
set display+=lastline
set laststatus=2
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

" behavior
let mapleader = ' '
set backspace=2
set complete-=i
set completeopt-=preview
set mouse=a
set scrolloff=5
set wildignore+=*.swp,*.bak,*.pyc,*.class,*.jar,*.gif,*.png,*.jpg,*.svg
set wildignore+=*/vendor/*,*/node_modules/*,*/svg/*,*/fonts/*,*/images/*

if has('nvim')
    set inccommand=split
endif

" mappings
nnoremap j gj
nnoremap k gk

" autocommands
autocmd BufReadPost * silent! normal! g`"

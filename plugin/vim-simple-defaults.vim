if exists("g:loaded_vim_simple_defaults")
  finish
endif
let g:loaded_vim_simple_defaults = 1

let g:vsd_tab_length = get(g:, 'vsd_tab_length', 4)
let g:vsd_beta_options = get(g:, 'vsd_beta_options', 0)
let g:vsd_ctrlp_options = get(g:, 'vsd_ctrlp_options', 0)

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
set complete-=t
set mouse=a
set path+=**
set wildignore+=*.swp,*.bak,*.pyc,*.class,*.jar,*.gif,*.png,*.jpg,*.svg

" theme
set background=dark

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

if g:vsd_beta_options
    let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
    set termguicolors

    set scrolloff=5
    set laststatus=0

    autocmd FileType ruby,eruby setl iskeyword+=?,!
    autocmd FileType go setl noexpandtab
    autocmd CursorHold * checktime
endif

if g:vsd_ctrlp_options
    "let g:ctrlp_clear_cache_on_exit = 0
    let g:ctrlp_max_files = 200000
    let g:ctrlp_mruf_exclude = '.*/tmp/.*\|.*/.git/.*'
    let g:ctrlp_mruf_relative = 1
    if executable('ag')
        let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
        let g:ctrlp_use_caching = 0
    endif
endif

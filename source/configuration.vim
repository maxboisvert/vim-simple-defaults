" vim-simple-defaults
" maxboisvert.com

" init

let g:vsd_tab_length = get(g:, 'vsd_tab_length', 4)
let g:vsd_options = get(g:, 'vsd_options', 1)
let g:vsd_trailing_whitespace = get(g:, 'vsd_trailing_whitespace', 1)
let g:vsd_autocommands = get(g:, 'vsd_autocommands', 1)
let g:vsd_commands = get(g:, 'vsd_commands', 1)
let g:vsd_mappings = get(g:, 'vsd_mappings', 1)
let g:vsd_leader = get(g:, 'vsd_leader', ' ')
let g:vsd_plugins_loaded = get(g:, 'vsd_plugins_loaded', 0)

" functions

if g:vsd_options == 1
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
	let mapleader = g:vsd_leader
	set backspace=2
	set mouse=a
	set complete-=i
	set scrolloff=5
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
endif

if g:vsd_mappings == 1
	nnoremap <Tab> :b#<CR>
	map <Backspace> :nohlsearch<cr>
	map <expr> <Enter> &filetype == "qf" ? "\<CR>" : ":"

	nnoremap j gj
	nnoremap k gk

	if has('nvim')
		tnoremap <Esc> <C-\><C-n>
	endif
endif

if g:vsd_commands == 1
	command Bd :bp | :bd #
endif

if g:vsd_autocommands == 1
	autocmd BufEnter * silent! normal! g`"
endif

if g:vsd_trailing_whitespace == 1
	highlight ExtraWhitespace ctermbg=red guibg=red
	match ExtraWhitespace /\s\+\%#\@<!$/
endif

if g:vsd_plugins_loaded == 1
	" gitignore
	autocmd VimEnter * silent! WildignoreFromGitignore

	" plugins configuration
	" ctrlp (F5 to clear cache)
	let g:ctrlp_mruf_exclude = '.*/tmp/.*\|.*/.git/.*'
	let g:ctrlp_max_files = 200000
	let g:ctrlp_mruf_relative = 1
	let g:ctrlp_map = ''

	" nerdtree
	let g:NERDTreeMouseMode=3
	let g:NERDTreeIgnore = ['\.pyc$']

	" neoterm
	let g:neoterm_size = 10

	" nerdtree
	let g:NERDTreeMouseMode=3
	let g:NERDTreeIgnore = ['\.pyc$']

	if g:vsd_mappings == 1
		nnoremap <Leader>o :CtrlPMRUFiles<CR>
		nnoremap <Leader>p :CtrlP<CR>
		nnoremap <Leader>l :CtrlPLine<CR>

		map <Leader>/ :call NERDComment(0,"toggle")<CR>
		nnoremap <Leader>\ :NERDTreeToggle<CR>
	endif
endif


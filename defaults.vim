" vim-simple-defaults

" init

if exists("g:vsd_vimrc_loaded")
  finish
endif

if exists("g:loaded_vim_simple_defaults")
  finish
endif
let g:loaded_vim_simple_defaults = 1

fun! VsdPlugins()
    let g:vsd_plugins_loaded = 1

    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'justinmk/vim-sneak'
    Plug 'vim-scripts/gitignore'
    Plug 'jiangmiao/auto-pairs'
    Plug 'alvan/vim-closetag'
    Plug 'maxboisvert/vim-simple-complete'
    Plug 'scrooloose/nerdtree'
    Plug 'scrooloose/nerdcommenter'
    Plug 'kassio/neoterm'
endfun

fun! VsdConfiguration()
    let g:vsd_tab_length = get(g:, 'vsd_tab_length', 4)
    let g:vsd_options = get(g:, 'vsd_options', 1)
    let g:vsd_trailing_whitespace = get(g:, 'vsd_trailing_whitespace', 1)
    let g:vsd_autocommands = get(g:, 'vsd_autocommands', 1)
    let g:vsd_commands = get(g:, 'vsd_commands', 1)
    let g:vsd_mappings = get(g:, 'vsd_mappings', 1)
    let g:vsd_leader = get(g:, 'vsd_leader', ' ')
    let g:vsd_plugins_loaded = get(g:, 'vsd_plugins_loaded', 0)
    let g:vsd_ag = get(g:, 'vsd_ag', 0)
    let g:vsd_ruby = get(g:, 'vsd_ruby', 0)
    let g:vsd_go = get(g:, 'vsd_go', 0)
    let g:vsd_git = get(g:, 'vsd_git', 0)

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
        let g:mapleader = g:vsd_leader
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
        nnoremap  <Tab> :b#<CR>
        nnoremap  <Leader>f :let @+ = expand("%")<CR>
        nnoremap  <Leader>r @:
        nnoremap <Leader>w :wincmd w<CR>
        nnoremap j gj
        nnoremap k gk

        map <Backspace> :nohlsearch<cr>
        map <expr> <Enter> &filetype == "qf" ? "\<CR>" : ":"

        if has('nvim')
            tnoremap <Esc> <C-\><C-n>
        endif
    endif

    if g:vsd_commands == 1
        command Bd :bp | :bd #
    endif

    if g:vsd_autocommands == 1
        autocmd CursorHold * checktime
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
        let g:ctrlp_clear_cache_on_exit = 0
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

        " sneak
        let g:sneak#streak = 1
        let g:sneak#use_ic_scs = 1

        if g:vsd_mappings == 1
            nnoremap <Leader>o :CtrlPMRUFiles<CR>
            nnoremap <Leader>p :CtrlP<CR>
            nnoremap <Leader>l :CtrlPLine<CR>

            map <Leader>/ :call NERDComment(0,"toggle")<CR>
            nnoremap <Leader>\ :NERDTreeToggle<CR>
        endif
    endif

    if g:vsd_ag == 1
        " ag : for ctrlp, grep and copen
        if executable('ag')
            let &grepprg = 'ag --nogroup --nocolor'
            let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
            let g:ctrlp_clear_cache_on_exit = 1
        endif
    endif

    if g:vsd_go == 1
        autocmd filetype go setl noexpandtab
    endif

    if g:vsd_ruby == 1
        autocmd BufNewFile,BufRead Gemfile,Vagrantfile,Guardfile set filetype=ruby

        command RubocopAll execute ':T bundle exec rubocop'
        command RubocopFile execute ':T bundle exec rubocop %'

        command RspecFile execute ':T bundle exec rspec --fail-fast --format progress %'
        command RspecLine execute ':T bundle exec rspec --fail-fast --format progress %:' . line('.')
        command RspecAll execute ':T bundle exec rspec --fail-fast --format progress'
    endif

    if g:vsd_git == 1
        command GitStatus execute ':T git status'
        command GitLog execute ':T git log'
        command GitDiff execute ':T git diff'
        command GitCommit execute ':T git add -A ; git commit'
        command GitAmend execute ':T git commit . --amend'
    endif
endfun

# Vim simple defaults
This is a light distribution to get started with vim. It includes defaults plugins and configuration.

## Insatallation
With Vim-plug :

```
silent! source $HOME/.vim/plugged/vim-simple-defaults/defaults.vim

call plug#begin()
Plug 'maxboisvert/vim-simple-defaults'
silent! call VsdPlugins()
call plug#end()

silent! call VsdConfiguration()
```
## Included plugins
```
'ctrlpvim/ctrlp.vim'
'justinmk/vim-sneak'
'vim-scripts/gitignore'
'jiangmiao/auto-pairs'
'alvan/vim-closetag'
'maxboisvert/vim-simple-complete'
'scrooloose/nerdtree'
'scrooloose/nerdcommenter'
'kassio/neoterm'
'kchmck/vim-coffee-script'
```
## Configuration
There are the possible options with their default value :
```
let g:vsd_options = 1
let g:vsd_trailing_whitespace = 1
let g:vsd_autocommands = 1
let g:vsd_commands = 1
let g:vsd_mappings = 1
let g:vsd_tab_length = 4
let g:vsd_leader = ' '
let g:vsd_all = 0 (This will enable by default the following options)
let g:vsd_ag = 0
let g:vsd_ruby = 0
let g:vsd_go = 0
let g:vsd_git = 0
```

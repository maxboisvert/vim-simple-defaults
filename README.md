# Vim simple defaults

This is a light distribution to get started with vim. It includes defaults plugins and configuration.

## Installation

### Plugins

With vim-plug :
```
call plug#begin()
Plug 'maxboisvert/vim-simple-defaults'
source PATH/vim-simple-defaults/source/plugins.vim
call plug#end()
```

### Configuration
Add this line on top of your vimrc :

```
source PATH/vim-simple-defaults/source/configuration.vim

```

#### Available options
```
let g:vsd_tab_length = 4
let g:vsd_options = 1
let g:vsd_trailing_whitespace = 1
let g:vsd_autocommands = 1
let g:vsd_commands = 1
let g:vsd_mappings = 1
let g:vsd_leader = ' '
```

## Features

### Options

### Plugins

### Trailing whitespaces

### Autocommands

### Commands

### Mappings

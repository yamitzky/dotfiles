set nocompatible
set backspace=indent,eol,start
set history=50
set ruler
set showcmd
set incsearch
set mouse=a
set autoindent
set fileformats=unix,dos,mac
set number
set tabstop=4
set softtabstop=2
set expandtab
set shiftwidth=2
set indentkeys=!^F,o,O
set list
set listchars=tab:>-,trail:-
set backupdir=$HOME/.vim/tmp
set writebackup
set swapfile
set directory=$HOME/.vim/tmp
set undodir=$HOME/.vim/tmp
set undofile
set clipboard+=unnamed
syntax on

if exists('&ambiwidth')
  set ambiwidth=double
endif

if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

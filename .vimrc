" Filename: ~/.vimrc
" Maintainer: Gustavo Niemeyer <niemeyer@conectiva.com>
" Last Change: Sat, 19 Feb 2011 19:44:06 -0200

set nocompatible " Load defaults to vim
set ai           " Turn autoindent on
set bs=2         " Turn on backspace everywhere in insert mode
set ruler        " Turn line information always on
set hlsearch     " Highlight search strings
set magic        " Turn on magic regular expressions
set nowrap       " Turn off line wrapping
"set cscopetag    " Replace tags functions by cscope
set linebreak    " Break at word boundaries when wrapping
set viminfo='50,\"1000,%
set nobackup
set background=dark
set tags=tags;/

" Set leader for plugins' maps
"let mapleader=","
let maplocalleader=","

" Enable syntax and plugin goodness
syntax on
filetype indent on
filetype plugin on

" Make comments more visible
hi comment ctermfg=cyan

" Use white on black in GUI.
hi normal guibg=black guifg=white

" In GUI, disable menubar and toolbar, and use console-based dialogs.
set guioptions-=T
set guioptions-=m
set guioptions+=c
set guifont=Monospace\ 13

" Setup spcchlog plugin
let spec_chglog_format = "%a %b %d %Y Gustavo Niemeyer <gustavo@niemeyer.net>"
let spec_chglog_release_info = 1

" Load matchit
source $VIMRUNTIME/macros/matchit.vim

" Typing %/ on command line expands to current file's path.
cmap %/ <C-R>=expand("%:h") . '/'<CR>

" Reposition cursor in last known position, and center window at that point.
au BufReadPost *
	\ if line("'\"") > 0
	\ |   if line("'\"") <= line("$")
	\ |     exe "norm '\"z."
	\ |   else
	\ |     exe "norm $"
	\ |   endif
	\ | endif


" Fix CTRL-PGUP and CTRL-PGDOWN in tmux.
if &term == "screen"
	set t_kN=[6;*~
	set t_kP=[5;*~
endif

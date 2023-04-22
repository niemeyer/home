" Filename: ~/.vimrc
" Maintainer: Gustavo Niemeyer <niemeyer@conectiva.com>
" Last Change: sáb, 22 abr 2023 14:18:32 +0100

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
set belloff=all  " Disable all bells.

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


" let gofmt_command="goimports"

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

" Remap omnifunc autocompletion

" Disable preview window.
set completeopt=menuone,longest  "preview

" This is misbehaving on Android.
"function! TabCompletion()
"	let col = col('.') - 1
"	if col == 0 || getline('.')[:col-1] =~ '^\s*$'
"		return "\<tab>"
"	else
"		return "\<C-x>\<C-o>"
"	endif
"endfunction
"inoremap <Tab> <c-r>=TabCompletion()<cr>
"inoremap <S-Tab> <Tab>
"inoremap <C-Tab> <Tab>    " Doesn't work due to terminal issues.
"inoremap <Nul> <C-x><C-o> " Mapping of CTRL-Space

" Make the completion menu more visible.
hi Pmenu ctermfg=white ctermbg=black
hi PmenuSel ctermfg=white ctermbg=darkblue

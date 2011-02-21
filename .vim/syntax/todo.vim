" Vim syntax file
" Filename:	todo.vim
" Language:	"todo" files
" Maintainer: Gustavo Niemeyer <niemeyer@conectiva.com>
" Last Change: Wed, 28 Jun 2006 16:41:17 -0300

" remove any old syntax stuff hanging around
syn clear

syn sync fromstart

syn match  todoComment  "^#.*$"
syn region todoLevel0   start="^[*-]"     end="^\t*[*-]"me=s-1 contains=todoActive
syn region todoLevel1   start="^\t\{1}\*" end="^\t*[*-]"me=s-1 contains=todoActive
syn region todoLevel2   start="^\t\{2}\*" end="^\t*[*-]"me=s-1 contains=todoActive
syn region todoLevel3   start="^\t\{3}\*" end="^\t*[*-]"me=s-1 contains=todoActive
syn region todoLevel4   start="^\t\{4}\*" end="^\t*[*-]"me=s-1 contains=todoActive
syn region todoLevel5   start="^\t\{5}\*" end="^\t*[*-]"me=s-1 contains=todoActive
syn region todoDone     start="^\t*-"     end="^\t*[*-]"me=s-1
syn match  todoActive   "^\s*\*" contained

if !exists("did_dic_syntax_inits")
  let did_dic_syntax_inits = 1
  " The default methods for highlighting.  Can be overridden later.
  " Or put your favorite colors directly here.
  hi link todoComment	Comment
  hi      todoLevel0    ctermfg=yellow guifg=yellow
  hi      todoLevel1    ctermfg=cyan guifg=cyan
  hi      todoLevel2    ctermfg=magenta guifg=magenta
  hi      todoLevel3    ctermfg=green guifg=green
  hi      todoLevel4    ctermfg=darkcyan guifg=darkcyan
  hi      todoLevel5    ctermfg=yellow guifg=yellow
  hi      todoActive    ctermfg=red guifg=red
  hi      todoDone      ctermfg=darkgray guifg=darkgray
endif

let b:current_syntax = "todo"

" vim: ts=4 et nowrap

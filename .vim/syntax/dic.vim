" Vim syntax file
" Filename:	dic.vim
" Language:	Linuxconf dic file
" Maintainer:	Gustavo Niemeyer <niemeyer@conectiva.com>
" Last Change: Tue, 17 Apr 2001 13:04:04 -0300

" remove any old syntax stuff hanging around
syn clear

" dic syntax is case sensitive
syn case match

syn sync lines=30

syn region dicError           start="^[^#@]" end="$"
syn match  dicComment         "^#.*$"
syn match  dicNewMsg          "^# \*\*\* \(updated\|new\) message$"
syn match  dicTag             "^\![A-Za-z0-9_]\+$"
syn match  dicVersion         "^@version .*$"
syn match  dicSpecial         "%\(\d\+\$\)\=[-+' #0*]*\(\d*\|\*\|\*\d\+\$\)\(\.\(\d*\|\*\|\*\d\+\$\)\)\=\([hlL]\|ll\)\=\([diuoxXfeEgGcCsSpn]\|\[\^\=.[^]]*\]\)" contained
syn match  dicSpecial         "%%" contained
syn match  dicSpecial         "\\\(x\x\+\|\o\{1,3}\|.\|$\)" contained

"syn region dicFold          start="^!" end=".\{-}\(^!\)"me=e-1 fold contains=dicTag,dicOld,dicTranslat,dicSource

if exists("dic_relaxed_syntax")
  syn region dicOld	        start="^[ \t]*:Z " end="^!\|^[ \t]*[^+ ]"me=s-1 contains=dicSpecial
  syn region dicTranslat        start="^[ \t]*:T " end="^!\|^[ \t]*[^+ ]"me=s-1 contains=dicSpecial
  syn region dicSource	        start="^[ \t]*:E " end="^!\|^[ \t]*[^+ ]"me=s-1 contains=dicSpecial
else
  syn region dicOld             start="^    :Z " end="^!\|^[ \t]*[^+ ]"me=s-1 contains=dicSpecial
  syn region dicTranslat        start="^    :T " end="^!\|^[ \t]*[^+ ]"me=s-1 contains=dicSpecial
  syn region dicSource          start="^    :E " end="^!\|^[ \t]*[^+ ]"me=s-1 contains=dicSpecial
endif

if !exists("did_dic_syntax_inits")
  let did_dic_syntax_inits = 1
  " The default methods for highlighting.  Can be overridden later.
  " Or put your favorite colors directly here.
  hi link dicComment	Comment
  hi      dicTag	ctermfg=yellow
  hi      dicNewMsg	ctermfg=red
  hi      dicSource	ctermfg=darkcyan
  hi      dicOld	ctermfg=darkgreen
  hi      dicTranslat	ctermfg=white
  hi      dicVersion    ctermfg=blue
  hi link dicError	Error
  hi link dicSpecial    Special
endif

let b:current_syntax = "dic"
set foldmethod=syntax

" vim: ts=4 et nowrap

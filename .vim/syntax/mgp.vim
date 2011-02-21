" MagicPoint syntax file
" Filename:	mgp.vim
" Language:	MagicPoint syntax files
" Maintainer: Gustavo Niemeyer <niemeyer@conectiva.com>
" Last Change: Fri, 14 Jun 2002 01:48:18 -0300

" remove any old syntax stuff hanging around
syn clear

" mgp syntax is not case sensitive
syn case ignore

syn sync lines=30

syn match mgpComment        "^\(%%\|#\).*$"
syn match mgpKeyword        "\<\(\(end\)*filter\|include\|size\|fore\|back\|bgrad\|left\|leftfill\|center\|right\|shrink\|lcutin\|rcutin\|cont\|nodefault\|xfont\|vfont\|tmfont\|tfont0\|bar\|image\|newimage\|prefix\|icon\|arc\|box\|delta1\|delta2\|delta3\|delta4\|dia\|bimage\|default\|tab\|page\|vgap\|hgap\|pause\|mark\|again\|system\|vfcap\|tfdir\|deffont\|\(tm\|[xvt]\)\=font\|tfont0\|noop\|pcache\)\>" contained
syn region mgpString        start=+"+ end=+"+ contained
syn match mgpNumber         "\<[0-9x]\+\>" contained
syn match mgpPercent        "^%" contained
syn match mgpCommandLine    "^%[^%].*$" contains=mgpPercent,mgpKeyword,mgpString,mgpNumber
"syn match mgpFilter         "\(^%filter\)\_.\{-}\(^%endfilter$\)" contains=mgpFilterStart,mgpFilterEnd
"syn match mgpFilterEnd      "^%endfilter$" contained contains=mgpPercent,mgpKeyword,mgpString
"syn match mgpFilterStart    "^%filter .*$" contained contains=mgpPercent,mgpKeyword,mgpString

if !exists("did_dic_syntax_inits")
  let did_dic_syntax_inits = 1
  " The default methods for highlighting.  Can be overridden later.
  " Or put your favorite colors directly here.
  hi link mgpComment	Comment
  hi link mgpKeyword    Keyword
  hi link mgpString     String
  hi link mgpNumber     Number
  hi link mgpPercent    Special
  "hi link mgpFilter     Special
endif

let b:current_syntax = "mgp"

" vim: ts=4 et nowrap

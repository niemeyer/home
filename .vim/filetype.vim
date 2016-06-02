augroup filetype

au! BufRead,BufNewFile *.dic set filetype=dic
au! BufRead,BufNewFile *.mgp set filetype=mgp
au! BufRead,BufNewFile *.todo set filetype=todo
au! BufRead,BufNewFile svn-commit.* set filetype=svn
au! BufRead,BufNewFile *.zcml set filetype=xml ts=4 sw=4 et
au! BufRead,BufNewFile *.erl set ts=4 sw=4 et
au! BufRead,BufNewFile *.hrl set ts=4 sw=4 et
au! BufRead,BufNewFile *.py syn sync minlines=2000
au! BufRead,BufNewFile *.html set indentexpr=
au! BufRead,BufNewFile *.pt set indentexpr=
au! BufRead,StdinReadPost *
    \ if getline(1) =~ '^=== \(modified\|added\|removed\|renamed\)'
    \ | setf diff | endif
au! BufRead,BufNewFile *.moin
    \ if getline(1) =~ '^@@ Syntax: 1\.5$' | setf moin1_5
    \ | else | setf moin1_6 | endif
au! BufRead,BufNewFile *.lua set ts=4 sw=4 et
au! BufRead,BufNewFile *.java set ts=4 sw=4 et
au! BufRead,BufNewFile *.scala set ts=4 sw=4 et ft=scala
au! BufRead,BufNewFile *.xml set ts=2 sw=2 et
au! BufRead,BufNewFile *.go set ft=go
au! BufRead,BufNewFile review.txt set ft=review
au! BufRead,BufNewFile *.mustache set ft=mustache
au! BufRead,BufNewFile *.rl set ft=ragel

augroup END

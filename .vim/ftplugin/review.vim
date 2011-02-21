if exists("b:did_ftplugin")
    finish
endif

command! -buffer -nargs=? Number call s:Number(<q-args>)
map <buffer> <LocalLeader>n :Number<CR>

function! s:Number(startn)
    let view = winsaveview()

    let n = 1
    if a:startn != ""
	    let n = a:startn
    endif

    let line = 0
    while line <= line('$')
	let m = matchlist(getline(line), '^\[\(X\|\d\+\)\]$')
	if !empty(m)
		if m[1] == 'X'
			call setline(line, '[' . n . ']')
		else
			let n = m[1]
		endif
        let n += 1
	endif
        let line = line + 1
    endwhile

    " Put buffer back where it was.
    call winrestview(view)
endfunction

" vim:ts=4:sw=4:et

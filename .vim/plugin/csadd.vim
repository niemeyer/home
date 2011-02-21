" Plugin to add cscope databases recursively
" Filename: csadd.vim
" Maintainer: Gustavo Niemeyer <niemeyer@conectiva.com>
" Last Change: Tue, 08 Jan 2002 18:39:12 -0200

function! s:CscopeAdd()
	if has("cscope")
		if exists("g:csadd_dont_kill")
			cs reset
		else
			cs kill -1
		endif
		if exists("g:csadd_flags")
			let flags = g:csadd_flags
		else
			let flags = ""
		endif
		if exists("g:csadd_filename")
			let filename = "/" . g:csadd_filename
		else
			let filename = "/cscope.out"
		endif
		let dir = expand("%:p")
		while 1
			let dir = strpart(dir,0,matchend(dir,"^.*/")-1)
			let file = dir . filename
			if filereadable(file)
				exec "cs add " . file . " " . dir . "/" . " " . flags
			endif
			if strlen(dir) == 0
				break
			endif
		endwhile
	endif
endfunction

command! -nargs=0 CscopeAdd call s:CscopeAdd()

CscopeAdd

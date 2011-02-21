" Plugin to update the "Last Change:" comment
" Filename: updlstch.vim
" Maintainer: Gustavo Niemeyer <niemeyer@conectiva.com>
" Last Change: Thu, 19 Apr 2001 22:13:39 -0300

if !exists("updlstch_format")
	let updlstch_format = "%a, %d %b %Y %H:%M:%S %z"
endif

au BufWrite *.vim,*.vimrc call UpdateLastChange(strftime(updlstch_format))

function! UpdateLastChange(time)
	let l:lnum = line(".")
	let l:vcol = virtcol(".")
	if search('^" Last Change:',"w")
		call setline(line("."),"\" Last Change: " . a:time)
	endif
	exe l:lnum
	exe "normal " . l:vcol . "|"
endf

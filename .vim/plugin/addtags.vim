" Plugin to add cscope databases recursively
" Filename: addtags.vim
" Maintainer: Gustavo Niemeyer <gustavo@niemeyer.net>
" Last Change: Fri, 24 Mar 2006 16:17:23 -0300

function! s:AddTags()
	if exists("g:add_tags_filename")
		let filename = "/" . g:add_tags_filename
	else
		let filename = "/tags"
	endif
	let dir = expand("%:p")
	let tags_value = ""
	while 1
		let dir = strpart(dir,0,matchend(dir,"^.*/")-1)
		let file = dir . filename
		if filereadable(file)
			if strlen(tags_value) == 0
				let tags_value = file
			else
				let tags_value = tags_value . "," . file
			endif
		endif
		if strlen(dir) == 0
			break
		endif
	endwhile
	if strlen(tags_value) != 0
		let &tags=tags_value
	endif
endfunction

command! -nargs=0 AddTags call s:AddTags()

AddTags

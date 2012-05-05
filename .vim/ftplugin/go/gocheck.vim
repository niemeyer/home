


map <buffer> <LocalLeader>t :make test<CR>

set makeprg=go
setlocal errorformat=
	\%-EPANIC:\ %f:%l:\ %.%#,
	\%-EFAIL:\ %f:%l:\ %.%#,
	\%+C...\ %.%#,
	\%-C\ %.%#,
	\%Z,
	\%Dmake[%*\\d]:\ Entering\ directory\ `%f',
	\%Xmake[%*\\d]:\ Leaving\ directory\ `%f',
	\%E%f:%l:,
	\%f:%l:\ %m

"setlocal errorformat=
"	\%-EPANIC:\ %f:%l:\ %.%#,
"	\%-EFAIL:\ %f:%l:\ %.%#,
"	\%-C...\ Assert(%.%#):,
"	\%-C...\ Check(%.%#):,
"	\%+C...\ %.%#,
"	\%Z,
"	\%Dmake[%*\\d]:\ Entering\ directory\ `%f',
"	\%Xmake[%*\\d]:\ Leaving\ directory\ `%f',
"	\%E%f:%l\ >\ %.%#,
"	\%E%f:%l:,
"	\%f:%l:\ %m

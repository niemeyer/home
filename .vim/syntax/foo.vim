
syn sync match fooSync grouphere NONE /^foo\>/
syn region fooComment start=+"+ end=+"+
hi def link fooComment String 

"syn region fooString start=+"+ end=+"+
"syn sync match fooSync grouphere fooString /^foo\>/
"hi def link fooString String

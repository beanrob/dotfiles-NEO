" Vim syntax file
" Language: TODO
" Maintainer: beanrob
" Latest Revision: Mar 2, 2025

if exists("b:current_syntax")
  finish
endif

syn keyword urgent   URGNT
syn keyword item     TODO 
syn keyword todo     TODAY
syn keyword tomorrow TOMORROW
syn match   done     "DONE.*$"
syn keyword started  STARTED
syn keyword deadline DEADLINE
syn keyword idea     IDEA

hi def link urgent   Error
hi def link item     String
" hi def link today    Define
hi def link tomorrow Constant
hi def link started  Boolean
hi def link done     Comment
hi def link deadline Include
hi def link idea     Special

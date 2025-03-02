" Vim syntax file
" Language: TODO
" Maintainer: beanrob
" Latest Revision: Mar 2, 2025

if exists("b:current_syntax")
  finish
endif

syn keyword urgent   URGNT
syn keyword todo     TODO 
syn keyword today    TODAY
syn keyword done     DONE
syn keyword started  STARTED
syn keyword deadline DEADLINE

hi def link urgent   Error
hi def link todo     String
hi def link today    Define
hi def link started  Boolean
hi def link done     Comment
hi def link deadline Include

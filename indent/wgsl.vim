if exists("b:did_indent")
  finish
endif
let b:did_indent = 1

setlocal autoindent
setlocal nolisp
setlocal nosmartindent
setlocal indentexpr=WgslIndent(v:lnum)

" Only define the function once.
if exists("*WgslIndent")
  finish
endif

let s:cpo_save = &cpo
set cpo&vim

function! WgslIndent(lnum)
  if a:lnum == 1
    return 0
  endif

  let l:indent = indent(a:lnum)
  let l:prev_line = getline(a:lnum - 1)
  let l:line = getline(a:lnum)

  " Ending with {, (, or [
  if l:prev_line =~# '^.*\({\|(\|[\)\s*$'
    if l:line =~# '^\s*$'
      return l:indent + &shiftwidth
    endif
  endif

  " Ending with }
  if l:line =~# '^\s*}\s*$'
    return l:indent - &shiftwidth
  endif

  return l:indent
endfunc

let &cpo = s:cpo_save
unlet s:cpo_save

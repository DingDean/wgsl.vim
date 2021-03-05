autocmd BufRead,BufNewFile *.wgsl call s:set_wgsl_filetype()

function! s:set_wgsl_filetype() abort
    if &filetype !=# 'wgsl'
        set filetype=wgsl
    endif
endfunction

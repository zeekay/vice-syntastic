func! vice#syntastic#check()
    SyntasticCheck
    if exists('g:vice_syntastic_hook')
        exe 'call '.g:vice_syntastic_hook.'()'
    endif
endf

" Disable autocommand to enable syntastic and do check
func! vice#syntastic#enable()
    augroup vice_syntastic
        au!
        au BufWritePost * call vice#syntastic#check()
    augroup END

    call vice#ForceActivateAddon('github:scrooloose/syntastic')
    call vice#syntastic#check()
endf

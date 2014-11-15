func! vice#syntastic#check()
    SyntasticReset
    SyntasticCheck
    for hook in g:vice.syntastic.hooks
        exe 'call '.hook.'()'
    endfor
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

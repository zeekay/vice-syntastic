func! vice#syntastic#quit_hook()
    let g:vice.syntastic.quitting = 1
endf

func! vice#syntastic#check()
    if exists('g:vice.syntastic.quitting')
        return
    endif

    SyntasticCheck
    for hook in g:vice.syntastic.hooks
        exe 'call '.hook.'()'
    endfor
    redraw!
endf

" Disable autocommand to enable syntastic and do check
func! vice#syntastic#enable()
    if exists('g:vice.syntastic.quitting')
        return
    endif

    augroup vice_syntastic
        au!
        au BufWritePost * call vice#syntastic#check()
    augroup END
    call vice#ForceActivateAddon('github:scrooloose/syntastic')
    call vice#syntastic#check()
endf

func! vice#syntastic#find_jshintrc()
    let jshintrc = findfile('.jshintrc')
    if jshintrc == ""
        let g:syntastic_javascript_jshint_args = g:vice.syntastic.jshint_args
    else
        let g:syntastic_javascript_jshint_args = '--config '.jshintrc
    endif
endf

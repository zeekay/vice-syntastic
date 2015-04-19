call vice#Extend({
    \ 'addons': [
        \ 'github:zeekay/QuickFixCurrentNumber',
    \ ]
\ })

if !exists('g:vice.syntastic.hooks')
    let g:vice.syntastic = {'hooks': []}
endif

call vice#CreateCommand('SyntasticCheck', ['github:scrooloose/syntastic'])

" let g:syntastic_mode_map                    = {"mode": "passive"}
let g:syntastic_always_populate_loc_list    = 1
let g:syntastic_aggregate_errors            = 1
let g:syntastic_auto_loc_list               = 1
let g:syntastic_check_on_open               = 0
let g:syntastic_check_on_wq                 = 0
let g:syntastic_enable_highlighting         = 0
let g:syntastic_stl_format                  = 'line %F, 1 of %t'
let g:syntastic_enable_signs                = 1
let g:syntastic_error_symbol                = '!'
let g:syntastic_style_error_symbol          = '>'
let g:syntastic_style_error_symbol          = '› '
let g:syntastic_style_warning_symbol        = '› '
let g:syntastic_warning_symbol              = '.'

" CSS
let g:syntastic_csslint_options             = '--ignore = ids'

" HTML
let g:syntastic_html_tidy_ignore_errors = [
    \ '<html> proprietary attribute "xmlns:ng"',
    \ 'proprietary attribute "ng-',
    \ 'proprietary attribute "xt-',
    \ '<meta> proprietary attribute "property"',
    \ '<img> lacks "alt" attribute',
    \ '<img> lacks "src" attribute',
    \ 'trimming empty',
\ ]

" CoffeeScript
let g:syntastic_coffee_coffeelint_post_args = '--file '.g:vice.addon_dir.'/coffeelint.json'

" JavaScript
let g:syntastic_javascript_checkers         = ['jshint']
let g:syntastic_javascript_jshint_args      = '--config '.g:vice.addon_dir.'/jshint.json'
let g:syntastic_javascript_jslint_args      = '--browser --node --vars --plusplus'

" Python
let g:syntastic_python_checkers             = ['flake8']
let g:syntastic_python_flake8_args          = '--ignore=E127,E221,E223,E224,E225,E226,E231,E241,E251,E271,E272,E302,E303,W391,E501,E702,E711'
let g:syntastic_python_pylint_args          = '-d C0103,C0111,C0301,C0326,W0403,R0903'

" Go
let g:go_fmt_fail_silently = 1
let g:go_fmt_command       = "goimports"

augroup vice_syntastic
    au!
    au BufWrite * call vice#syntastic#enable()

    if v:version > 703 || (v:version == 703 && has('patch544'))
        au QuitPre * call vice#syntastic#quit_hook()
    endif
augroup END

au filetype python     command! -buffer Pylint SyntasticCheck pylint
au filetype javascript command! -buffer Jslint SyntasticCheck jslint

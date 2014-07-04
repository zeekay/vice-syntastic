call vice#Extend({
    \ 'addons': [
        \ 'github:scrooloose/syntastic',
        \ 'github:zeekay/QuickFixCurrentNumber',
    \ ]
\ })

let g:syntastic_aggregate_errors = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_enable_highlighting = 0
let g:syntastic_enable_signs = 1
let g:syntastic_check_on_open = 0
let g:syntastic_stl_format = '⚡︎ line %F, 1 of %t ⚡︎'

let g:syntastic_csslint_options = '--ignore=ids'

let g:syntastic_coffee_coffeelint_post_args = '--file '.g:vice.addon_dir.'/coffeelint.json'

" let g:syntastic_go_checkers= ['go']

let g:syntastic_javascript_jshint_args = '--config '.g:vice.addon_dir.'/jshint.json'

let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_args = '--ignore=E127,E221,E223,E224,E225,E226,E231,E241,E251,E271,E272,E302,E303,W391,E501,E702,E711'

let g:syntastic_error_symbol = '!'
let g:syntastic_warning_symbol = '.'
let g:syntastic_style_error_symbol = '>'
let g:syntastic_style_warning_symbol = '› '
let g:syntastic_style_error_symbol = '› '

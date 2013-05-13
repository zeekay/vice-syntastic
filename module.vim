call vice#Extend({
    \ 'addons': [
        \ 'github:scrooloose/syntastic',
    \ ]
\ })

let s:path = expand('<sfile>:p:h')

let g:syntastic_enable_signs = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_stl_format = '⚡︎ line %F, 1 of %t ⚡︎'
let g:syntastic_enable_highlighting = 0

let g:syntastic_csslint_options = '--ignore=ids'

let g:syntastic_coffee_coffeelint_post_args = '--file '.s:path.'/coffeelint.json'
let g:syntastic_javascript_jshint_conf = s:path.'/jshint.json'

let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_checker_args = '--ignore=E221,E225,E231,E251,E302,E303,W391,E501,E702'

let g:syntastic_error_symbol = '› '
let g:syntastic_warning_symbol = '› '
let g:syntastic_style_error_symbol = '› '
let g:syntastic_style_warning_symbol = '› '

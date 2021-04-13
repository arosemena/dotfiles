set background=dark

hi clear
if exists("syntax_on")
  syntax reset
endif

set t_Co=256
let g:colors_name = "nova"

" Colors
" 33  Light Blue
" 88  Dark Red
" 99  Purple
" 101 Light grey
" 119 Green
" 160 Red
" 220 Yellow
" 230 Dark grey
" 254 Light

hi Statement      ctermfg=33
hi Comment        ctermfg=101
hi Type           ctermfg=33
hi String			    ctermfg=220
hi Number         ctermfg=99
hi Constant       ctermfg=99
hi Function       ctermfg=160
hi PMenu          ctermbg=239 ctermfg=254
hi VertSplit      cterm=None

" JS specific settings
hi jsVariableDef  ctermfg=119
hi jsFuncArgs     ctermfg=99
hi jsRegexpString ctermfg=99

" CoC specific settings
hi CocErrorSign ctermfg=160 ctermbg=88

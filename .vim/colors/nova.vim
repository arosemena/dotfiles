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
" 239 Dark grey
" 254 Light

hi Statement      ctermfg=33
hi Comment        ctermfg=101
hi Type           ctermfg=33
hi String			    ctermfg=220
hi Number         ctermfg=99
hi Constant       ctermfg=99
hi Function       ctermfg=160
hi PMenu          ctermbg=239 ctermfg=254
hi VertSplit      ctermfg=239 cterm=None
hi SignColumn     ctermbg=None
hi TabLineFill    ctermbg=239 cterm=None
hi TabLine        ctermbg=239 cterm=None
hi TabLineSel     ctermbg=0   ctermfg=33
hi StatusLine     ctermbg=239 cterm=bold
hi StatusLineNC   ctermbg=239 cterm=None

" JS specific settings
hi jsVariableDef  ctermfg=119
hi jsFuncArgs     ctermfg=99
hi jsRegexpString ctermfg=99

" GitGutter settings
hi GitGutterAdd    ctermbg=None ctermfg=119
hi GitGutterDelete ctermbg=None ctermfg=160
hi GitGutterChange ctermbg=None ctermfg=33

" NerdTree
hi cursorLine      ctermbg=239 cterm=None

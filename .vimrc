" Disable arrow keys
nmap <Up> <Nop>
nmap <Right> <Nop>
nmap <Down> <Nop>
nmap <Left> <Nop>

" Keymaps
nnoremap <silent> <C-N> :Files<CR>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> <F2> <Plug>(coc-diagnostic-next)

nmap <C-k> :!date > /tmp/time<kEnter><kEnter>

" Settings
syntax on
set nocompatible
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set hlsearch
set pastetoggle=<F3>
set encoding=utf-8

" fzf settings
set rtp+=/usr/local/opt/fzf

" Color scheme
colorscheme nova

" Plugins
call plug#begin('~/.vim/plugged')

" Webdev plugins
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'othree/yajs.vim'
Plug 'neoclide/coc.nvim' , { 'branch' : 'release' }

" fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()

" Enable Typescript helpers
let g:coc_global_extensions = [ 'coc-tsserver', 'coc-eslint' ]

" Function to detect highlight groups
function! SynGroup()                                                            
    let l:s = synID(line('.'), col('.'), 1)                                       
    echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfun
nnoremap <silent> <F3> :call SynGroup()<CR>

" Disable arrow keys
nmap <Up> <Nop>
nmap <Right> <Nop>
nmap <Down> <Nop>
nmap <Left> <Nop>

" Keymaps
nnoremap <silent> <C-N> :Files<CR>

" Settings
syntax on
set nocompatible
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set number relativenumber
set hlsearch
set pastetoggle=<F3>
set encoding=utf-8

" fzf settings
set rtp+=/usr/local/opt/fzf
let g:fzf_action = {
    \ 'ctrl-t': 'tab split',
    \ 'ctrl-i': 'split',
    \ 'ctrl-s': 'vsplit'
    \ }

" Color scheme
colorscheme robscheme

" Plugins
call plug#begin('~/.vim/plugged')

" Webdev plugins
Plug 'pangloss/vim-javascript'    
Plug 'leafgarland/typescript-vim' 
Plug 'maxmellon/vim-jsx-pretty'   
Plug 'jparise/vim-graphql'        
Plug 'neoclide/coc.nvim' , { 'branch' : 'release' }

" fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()

" Enable Typescript helpers
let g:coc_global_extensions = [ 'coc-tsserver' ]

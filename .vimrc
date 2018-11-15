" Disable arrow keys
nmap <Up> <Nop>
nmap <Right> <Nop>
nmap <Down> <Nop>
nmap <Left> <Nop>

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

" Color scheme
colorscheme robscheme

" Load host specific settings
if filereadable(expand("$HOME/.vim/env/settings.vim"))
  source $HOME/.vim/env/settings.vim
endif

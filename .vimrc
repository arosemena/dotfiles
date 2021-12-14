" Use comma as leader
let mapleader=","

" Disable arrow keys
nmap <Up> <Nop>
nmap <Right> <Nop>
nmap <Down> <Nop>
nmap <Left> <Nop>

"Indent, save and go back in place
nmap <leader>s gg=G:w<CR>``

" Keymaps
nnoremap <silent> <C-N> :Files<CR>
nnoremap <silent> <leader>f :Ag<CR>

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> <F2> <Plug>(coc-diagnostic-next)
nmap <silent> P :CocCommand prettier.formatFile<CR>
nmap <silent> <O> :CocCommand tsserver.organizeImports<CR>
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

nnoremap <C-t> :NERDTreeToggle<CR>


" This triggers file watchers on /tmp/time
" serves as a proxy to running things like tests
" in another screen and triggering them without 
" leaving the current vim window
nmap <C-k> :!date > /tmp/time<kEnter><kEnter>

" Settings
if !exists('g:syntax_on')
	syntax enable
endif
set nocompatible
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set hlsearch
set pastetoggle=<F3>
set encoding=utf-8
set fillchars=vert:\│,stlnc:\─

" fzf settings
set rtp+=/usr/local/opt/fzf

" Color scheme
colorscheme nova

" Plugins
call plug#begin('~/.vim/plugged')

" Webdev plugins
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

" fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'preservim/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

Plug 'vim-airline/vim-airline'
Plug 'ryanoasis/vim-devicons'

call plug#end()

" Airline configs
let g:airline_powerline_fonts = 1
let g:airline#extensions#branch#enabled=1

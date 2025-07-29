:set number
:set smarttab
:set shiftwidth=4
:set tabstop=4
:set softtabstop=4

call plug#begin()

Plug 'https://github.com/vim-airline/vim-airline' 
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'

call plug#end()

" Airline
let g:airline_theme='base16_google_dark' 
" NerdTree
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap n :NERDTreeFocus<CR>
let NERDTreeShowHidden=1

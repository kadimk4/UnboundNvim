set mouse
set number
set relativenumber
set tabstop=4
set noswapfile
set scrolloff=7
set softtabstop=4
set shiftwidth=4
set expandtab

filetype indent on

call plug#begin()

"themes
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

let g:airline_theme = 'deus'
let g:airline_powerline_fonts = 1

set laststatus=2
set t_Co=256

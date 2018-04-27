au BufRead,BufNewFile *.hamlc set ft=haml

call pathogen#infect()

let g:jsx_ext_required=0
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

colorscheme OceanicNext

filetype plugin indent on

set background=dark
set clipboard=unnamed
set colorcolumn=81
set cursorline
set expandtab
set list listchars=eol:¬,tab:▸\ ,trail:･
set noantialias
set nowrap
set number
set ruler
set softtabstop=2
set tabstop=2
set noundofile

syntax on

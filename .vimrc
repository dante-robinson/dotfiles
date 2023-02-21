" Settings
set ttyfast			" Speed up scrolling
set spell			" Enable spell check
set spelllang=en		" Set spellcheck language
set spellsuggest=best,9		" Show up to 9 spellcheck languages
set noswapfile			" disable creating a swap file
set mouse=a			" enable mouse click
set clipboard=unnamedplus	" use system clipboard
set nocompatible		" disable compatibility to old-time vi
set backspace=indent,eol,start

" Plugins
call plug#begin()
 Plug 'ghifarit53/tokyonight-vim'
call plug#end()

" Load Theme
set termguicolors

let g:tokyonight_style = 'night' " available: night, storm
let g:tokyonight_enable_italic = 1

colorscheme tokyonight

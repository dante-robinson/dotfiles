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

" Autoinstall Plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Autoinstall Plugins 
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

" Plugins
call plug#begin()
 Plug 'ghifarit53/tokyonight-vim'
call plug#end()

" Load Theme
set termguicolors

let g:tokyonight_style = 'night' " available: night, storm
let g:tokyonight_enable_italic = 1

colorscheme tokyonight

" Vundle Config
" ---------------------------------------------------------
set nocompatible        " required
filetype off            " required

" Set the runtime path to include Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()


" Vundle plugins
" ---------------------------------------------------------
Plugin 'gmarik/Vundle.vim'
Plugin 'morhetz/gruvbox'
Plugin 'mattn/emmet-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'ajh17/spacegray.vim'

call vundle#end()


" VIM Config
" ---------------------------------------------------------

" Base
set encoding=utf-8
syntax on                           " syntax highlighting
filetype plugin on                  " filetype detection
filetype plugin indent on
set backspace=indent,eol,start      " backspace key works normally
set showmode                        " show current mode
set number relativenumber           " current line in absolute, others in relative
set wildmenu                        " show suggestions
set autoread                        " reload file when modified
set updatetime=100                  " faster gitgutter update
set ttimeoutlen=10                  " faster mode update

" Remove Arrow key
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Scroll
set scrolloff=10                    " start scroll 10 lines before the end of the screen
set sidescrolloff=15                " start scroll 15 characters before the end of the line
set sidescroll=1

" Colorscheme
set t_Co=256
set background=dark
colorscheme gruvbox
" colorscheme spacegray

" Fix Bug background color on 256colors terminal
if &term =~ '256color'
    set t_ut=
endif

" Indentation
set autoindent                      " always set autoindent on
set smartindent                     " smart indent after brackets
set smarttab
set expandtab                       " set tabs to two spaces
set tabstop=4                       " same
set softtabstop=4                   " same
set shiftwidth=4                    " same

" Backup
set backupdir=~/.vim/vimtmp,.
set directory=~/.vim/vimtmp,.
" set nobackup                      " if backup is not needed
" set noswapfile                    " if swapfile is not needed
" set nowritebackup

set list listchars=tab:\ \ ,trail:· " show invisible characters when typing
set nowrap                          " don't show entire line

" Search
set hlsearch                        " highlight search results
set incsearch                       " find the next match as we type
set ignorecase                      " case insensitive search

" Airline
let g:airline_theme='murmur'
set laststatus=0

" NERDTree
let NERDTreeMinimalUI = 1
autocmd vimenter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd VimEnter * wincmd p

" CTRLP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = {
 \ 'dir' : '\.sass-cache$\|bower_components$\|node_modules$\|\.git$\|tmp$\|\.svn$\|\.sass-cache$\|public/compiled$\|vendor/gems$',
 \ 'file': '\.git$\|\.hg$\|\.svn$\|\.scssc$'
 \ }

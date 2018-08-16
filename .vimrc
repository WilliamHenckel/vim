set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'morhetz/gruvbox'
Plugin 'mattn/emmet-vim'
Plugin 'scrooloose/nerdtree'

call vundle#end()
filetype plugin indent on

" Colorscheme
set t_Co=256
set background=dark
colorscheme gruvbox

" Fix Bug background color on 256colors terminal
if &term =~ '256color'
    set t_ut=
endif

set encoding=utf-8
syntax on
set number relativenumber
colorscheme gruvbox

set autoindent
set smartindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set showmode
set nowrap
set ignorecase
set nobackup
set noswapfile

set hlsearch

set laststatus=2
function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

set statusline=
set statusline+=%#PmenuSel#
set statusline+=%{StatuslineGit()}
set statusline+=%#LineNr#
set statusline+=\ %f
set statusline+=%m\
set statusline+=%=
set statusline+=%#CursorColumn#
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c
set statusline+=\

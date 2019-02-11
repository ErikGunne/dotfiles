set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'https://github.com/tpope/vim-surround'
Plugin 'https://github.com/NLKNguyen/papercolor-theme'
Plugin 'https://github.com/w0rp/ale'
Plugin 'https://github.com/rhysd/vim-clang-format'
call vundle#end()
filetype plugin indent on

" Clang Format
let g:clang_format#command = "/usr/bin/clang-format"
autocmd FileType c ClangFormatAutoEnable
autocmd FileType h ClangFormatAutoEnable
autocmd FileType cpp ClangFormatAutoEnable
autocmd FileType hpp ClangFormatAutoEnable

autocmd BufNewFile,BufReadPost *.md set filetype=markdown

filetype on

" Reload file if it was changed outside of vim but not inside.
set autoread

" Easier movement between splits.
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Quickly press jk or Ctrl-l to exit insert mode.
imap jk <Esc>
imap <C-l> <Esc>

" Enable syntax highlight
syntax on

" Disable terminal bell.
set vb t_vb=

" Insert spaces when tab is pressed.
set expandtab
" The size of a tab character.
set tabstop=4
" Number of leading spaces to delete when tab is pressed.
set softtabstop=4
" Number of spaces to insert when tab is pressed.
set shiftwidth=4

" Enable 256 colors
set t_Co=256

" Show column at width 80
set colorcolumn=80

" Show line numbers
set number

" Set colorscheme
set background=dark
colorscheme PaperColor

" Show trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" Cursor visibility settings
augroup CursorLine
	au!
	au VimEnter * setlocal cursorline
	au WinEnter * setlocal cursorline
	au BufWinEnter * setlocal cursorline
	au WinLeave * setlocal nocursorline
augroup END

" Automatically reload .vimrc.
augroup myvimrc
	au!
	au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

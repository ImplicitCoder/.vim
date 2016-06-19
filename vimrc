set nocompatible              
set encoding=utf-8

if has("autocmd")
	" Enable file type detection
	filetype on
endif

execute pathogen#infect()

"==== NerdTree config ====
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif 

"==== Powerline Config ====
let g:Powerline_symbols = 'fancy'
let g:Powerline_symbols = 'fancy'
let g:Powerline_dividers_override = ["\Ue0b0", "\Ue0b1", "\Ue0b2", "\Ue0b3"]
let g:Powerline_symbols_override = { 'BRANCH': "\Ue0a0", 'LINE': "\Ue0a1", 'RO': "\Ue0a2" }

"==== Whitespace behaviour ====
if has("autocmd")
  autocmd FileType python setlocal ts=4 sts=4 sw=4 expandtab
  autocmd FileType javascript setlocal ts=4 sts=4 sw=4 expandtab
  autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
endif

"==== General configuration ====
set cul "line with cursor is marked
set scrolloff=5
set number
set smartindent
filetype indent on
set showcmd
syntax on
set hlsearch
set mouse=a
set mousefocus
set incsearch           " search as characters are entered


" move vertically by visual line
nnoremap j gj
nnoremap k gk

"==== Key mappings ===
inoremap jj <ESC>
inoremap {<CR> {<CR>}<Esc>O
noremap <F1> <Esc>
"map comma, p to paste as a new line
:nmap ,p o<ESC>p
:nmap ,P O<ESC>p
" Unmap the arrow keys
no <down> ddp
no <left> <Nop>
no <right> <Nop>
no <up> ddkP
ino <down> <Nop>
ino <left> <Nop>
ino <right> <Nop>
ino <up> <Nop>
vno <down> <Nop>
vno <left> <Nop>
vno <right> <Nop>
vno <up> <Nop>
" gO to create a new line below cursor in normal mode
nmap g<C-O> o<ESC>k
" g<Ctrl+o> to create a new line above cursor (Ctrl to prevent collision with 'go' command)
nmap gO O<ESC>j
"quick pairs
imap <leader>' ''<ESC>i
imap <leader>" ""<ESC>i
imap <leader>( ()<ESC>i
imap <leader>[ []<ESC>i

" set bs=indent,eol,start	" allow backspacing over everything in insert mode
" set ai	" always set autoindenting on
" set viminfo='20,\"50 " read/write a .viminfo file, don't store more
" than 50 lines of registers
set history=50	" keep 50 lines of command line history
" set ruler	" show the cursor position all the time




" Always show statusline
set laststatus=2

" Wild menu (tab complete :commands)
set wildmenu

" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256
colorscheme distinguished

" Save undo history persistently on disk, takes extra space "{{{
if has('persistent_undo') " persistend undo history
" create the directory if it doesn't exist
silent !mkdir ~/.vim/undo > /dev/null 2>&1
set undofile " Save undo's after file closes
set undodir=~/.vim/undo/ " where to save undo histories
set undolevels=500 " How many undos
set undoreload=3000 " number of lines to save for undo
endif
"}}}


" Automatically reload vimrc when it's saved "{{{
augroup VimrcSo
au!
autocmd BufWritePost $MYVIMRC so $MYVIMRC
augroup END
"}}}

" Allow saving of files as sudo when I forgot to start vim using sudo.
 cmap w!! w !sudo tee > /dev/null %

 

let mapleader=","

"================= show fancy invisible chars on ,l ============
nmap <leader>l :set list!<CR>
set listchars=tab:▸\ ,eol:¬

" ,v opens .vimrc
nmap <leader>v :tabedit $MYVIMRC<CR>
" Source the vimrc file after saving it
if has("autocmd")
" Shortcut to rapidly toggle `set list`
  autocmd bufwritepost .vimrc source $MYVIMRC
endif

" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
let g:syntastic_always_populate_loc_list = 1
set statusline+=%*

"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

let g:syntastic_python_checkers = ['python']
let g:syntastic_javascript_checkers = ['jshint']

" XML folding
let g:xml_syntax_folding=1
au FileType xml setlocal foldmethod=syntax

" autosuggest completion for javascript
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS 

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rvm'
Plugin 'tpope/vim-dispatch'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-scripts/bufkill.vim'
Plugin 'fatih/vim-go'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'tmux-plugins/vim-tmux-focus-events'
Plugin 'rhysd/vim-color-spring-night'

Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'mileszs/ack.vim'
Bundle 'ervandew/supertab'
Bundle 'tpope/vim-rails'

call vundle#end()
filetype plugin indent on
syntax enable
set number
set noswapfile
set hlsearch
set guifont=Menlo\ Regular:h15
set ruler
map <M-b> :NERDTreeToggle<CR>
set backspace=indent,eol,start
nmap <M-F> :Ack!<space>--literal<space>
nmap <D-F> :Ack!<space>--literal<space>
map <F1> :tabm -1<CR>
map <F2> :tabm +1<CR>
map <D-/> <Plug>NERDCommenterToggle
imap <D-/> <C-\><C-O><Plug>NERDCommenterToggle
map <M-/> <Plug>NERDCommenterToggle
imap <M-/> <C-\><C-O><Plug>NERDCommenterToggle

" Map Ctrl + hjkl to nagivate different splits
" nnoremap <C-J> <C-W><C-J>
" nnoremap <C-K> <C-W><C-K>
" nnoremap <C-L> <C-W><C-L>
" nnoremap <C-H> <C-W><C-H>
nnoremap <F12> g]
vnoremap <F12> g]
highlight ColorColumn ctermbg=gray
set cc=80
map <F10> :Gblame<CR>
augroup buffchange
  autocmd BufWritePre * :%s/\s\+$//e
  autocmd BufLeave,FocusLost * silent! wall
augroup END

" Fold current paragraph
nnoremap <C-F> za


" Move current line up or down
map <silent> <c-up> :m -2<CR>
map <silent> <c-down> :m +1<CR>
" Set line number in sidebar to be relative rather than absolute
set relativenumber

" Buffer mappings
map <silent> <M-n> :enew!<CR>
map <M-w> :BD!<CR>
map <M-s> :w<CR>
map <silent> <M-q> :bufdo bd<CR>
nnoremap <silent> <leader>p :CtrlPBuffer<cr>
map <silent> <M-]> :bn!<CR>
map <silent> <M-[> :bp!<CR>

" Map jj to ESC
inoremap jj <ESC>

" Disable all search highlight with space bar
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" Close all non active windows
nmap <silent> <C-w> :only <CR>

" Dark blue color scheme
colorscheme lucario
" colorscheme spring-night
" colorscheme neodark

" Prevent meta keys from being interpreted and giving weird symbols
if has("gui_macvim")
  set macmeta
  set guioptions=
endif

" Automatically load newest files on opening if changed
set autoread

" Enable list of buffers to be displayed
let g:airline#extensions#tabline#enabled = 1

" Only show the filename in airline
let g:airline#extensions#tabline#fnamemod = ':t'

" Fold logic
" set foldmethod=syntax
" set foldlevelstart=99
" Set fold coloring so it's easier to read
highlight Folded guibg=#1F2F38 guifg=#AABBC4
" Set fold trailing characters to be spaces (invisible) instead of hyphens
set fillchars="fold: "

" Map semicolon to colon
nmap ; :

" Use silver searcher for search
let g:ackprg = 'ag --nogroup --nocolor --column'

" Highlight for readonly files
let g:NERDTreeGlyphReadOnly = "RO"

" Allow undo history to go beyond lifespan of current buffer
try
  set undodir=~/.vim_runtime/temp_dirs/undodir
  set undofile
catch
endtry

" Space after commenting
let g:NERDSpaceDelims = 1

" Use correct colors in tmux
set t_Co=256

" Make clipboard work with tmux
set clipboard=unnamed

" Make vim faster on switching files... somehow?
set hid

" Hide these files
let NERDTreeIgnore=['__pycache__']

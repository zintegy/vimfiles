" vundle stuff
set nocompatible              " be iMproved, required
filetype off                  " required
"
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'

" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
" Plugin 'valloric/youcompleteme' doesn't work bc of python madness
Plugin 'altercation/vim-colors-solarized'   " solarized
Plugin 'tomtom/tcomment_vim'                " gcc for comments.
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'ervandew/supertab'
" Plugin 'SirVer/ultisnips'
" Plugin 'airblade/vim-gitgutter'
Plugin 'mhinz/vim-signify'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-sleuth'
Plugin 'bling/vim-airline'
Plugin 'sheerun/vim-polyglot'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'leafgarland/typescript-vim'
Plugin 'majutsushi/tagbar'
Plugin 'wincent/terminus'
"Plugin 'neoclide/coc.nvim'
Plugin 'easymotion/vim-easymotion'
Plugin 'psf/black'
Plugin 'prettier/vim-prettier'
call vundle#end()            " required
filetype plugin indent on    " required


""""" END VUNDLE SETUP

" let g:polyglot_disabled = ['typescript']

syntax on       " enable syntax highlighting
set number      " line numbers
set showcmd     " show command in bottom bar
set cursorline  " highlight current line
set lazyredraw  " redraw only when we need to
set showmatch   " highlight matching parenthesis/brackets etc
set wrap        " wrapping
set linebreak   " break line at words
set autoread    "Reload files changed outside vim
set autoindent  " copies the indentation from the previous line.
set showmode    " shows the current mode at the bottom of vim.
"set visualbell  " vim flashes its scren instead of sounding a beep.
set ttyfast     " tell vim that the terminal is fast.
set ruler       " show line, column numbers in the status line.
set backspace=indent,eol,start " this makes backspace work like normal
set laststatus=2    " Shows current file in the status line.
set relativenumber " Show relative line numbers.


" Wildmenu
set wildmenu                    " visual autocomplete for command menu
set wildmode=list:longest,full  " Controls the behavior of the wildmenu.


" Search stuff.
set incsearch   " search as characters are entered
set hlsearch    " highlight matches
set ignorecase  " case-insensitive searching
set smartcase   " smart case searching
set scrolloff=5 " number of context lines before search result.
" maps ,<space> to :n
nnoremap ,<space> :noh<cr>

" Folding.
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
set foldmethod=indent   " fold based on indent level
nnoremap <space> za
" space opens/closes folds

" movement
nnoremap j gj
nnoremap k gk

"set iskeyword-=_

" Backups/undo
set backup
set undofile
set writebackup
set backupdir=/tmp
set directory=/tmp
set undodir=/tmp
set undodir=/tmp


" mouse
set mouse=a
map <ScrollWheelUp> <C-Y>
map <ScrollWheelDown> <C-E>
set ttymouse=xterm2


" colorscheme
colorscheme default


" Whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWritePre * :%s/\s\+$//e

" Others
" =====
" When opening a new file and current buffer has unsaved changes, cause files to
" hidden instead of closed.
set hidden
set encoding=utf-8

" vim-airline arrors.
let g:airline_powerline_fonts = 1
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" Source extenal vimrcs
if filereadable('~/qvimrc')
    so ~/qvimrc
endif


set splitright

" bind F to grep word under cursor
set grepprg=grep\ -nsRIH\ --exclude-dir=types\ --exclude-dir=sub_modules\ --exclude-dir=node_modules\ --exclude-dir=build
nnoremap F :grep! "<C-R><C-W>" *<CR>:cw<CR> <CR>

command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number '.shellescape(<q-args>), 0,
  \   { 'dir': systemlist('git rev-parse --show-toplevel')[0] }, <bang>0)

let g:fzf_action = {
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit'
      \ }

nnoremap <Leader><space> :w<CR>:call system('black ' . expand('%') . ' &')<CR>

" autocmd BufWritePost,FileWritePost *.py silent! :call system('black ' . expand('%') . ' &')

" set pastetoggle=<F2>

set colorcolumn=100

inoremap <Help> <Esc>

" CTRLL is next buffer
noremap <C-L> :bnext<CR>

" CTRLH jis previous buffer
noremap <C-H> :bprevious<CR>

inoremap kj <Esc>
inoremap jk <Esc>
set timeout timeoutlen=100

noremap j gj
noremap k gk
noremap E g$
noremap B g^

noremap $ <Nop>
noremap 0 <Nop>

" disables COC startup warning about updating vim
" let g:coc_disable_startup_warning = 1

" some coc settings
set cmdheight=2
set updatetime=300
set shortmess+=c

"inoremap <silent><expr> <TAB>
"      \ pumvisible() ? "\<C-n>" :
"      \ <SID>check_back_space() ? "\<TAB>" :
"      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


nnoremap ∆ <C-w>h
nnoremap ˙ <C-w>h
nnoremap ˚ <C-w>l
nnoremap ¬ <C-w>l


noremap <C-B> :Files<cr>
vnoremap <C-B> <Esc>:Files<cr>
inoremap <C-B> <Esc>:Files<cr>


" GoTo code navigation.
"nmap <silent> gd <Plug>(coc-definition)
"nmap <silent> gy <Plug>(coc-type-definition)
"nmap <silent> gi <Plug>(coc-implementation)
"nmap <silent> gr <Plug>(coc-references)
"


" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
" map  <Leader>w <Plug>(easymotion-bd-w)
" nmap <Leader>w <Plug>(easymotion-overwin-w)

nnoremap zxc :update<cr>

vmap > >gv
vmap < <gv

"let g:black_use_virtualenv = 0
autocmd VimEnter * Copilot disable
noremap <C-D> <Esc>:Copilot panel<cr>
noremap! <C-D> <Esc>:Copilot panel<cr>

map <Leader>q :q<Esc>
map <Leader>w :w<Esc>
map <Leader>wq :wq<Esc>

nnoremap <leader>g :lopen<cr> <cr> :lclose <cr> kj
nnoremap <leader>f :NERDTreeFind<CR>
nnoremap <leader>t :NERDTreeToggle<CR>
nnoremap <F8> :TagbarToggle<CR>
nnoremap <leader>r :TagbarOpenAutoClose<CR>





vmap <Enter> <Esc>


let g:copilot_node_command = "/home/ydeng/node-v20.18.0-linux-x64/bin/node"
" set pythonthreehome=/home/ydeng/ans/venv3.9/bin
"set pythonthreehome=/home/ydeng/ans/venv/bin
"set pythonthreedll=/home/ydeng/ans/venv3.9/lib/libpython3.9.a
"set pythonthreedll=/home/ydeng/venv/lib64
"set pythonthreehome=/usr/lib/python3.8/
"set pythonthreedll=/usr/lib/python3.8/config-3.8-x86_64-linux-gnu/libpython3.8.so

setlocal formatprg=black\ -q\ -
" nnoremap <leader>f ggVGgq<C-o><C-o>

command! -nargs=1 Silent execute ':silent !'.<q-args> | execute ':redraw!'



let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:tagbar_show_linenumbers = 2

set complete=.,w,b

highlight clear SignColumn
set signcolumn=number
let g:BASH_Ctrl_j = 'off'

" nmap <silent><C-j> <Esc>:echo 3<Return> doesn't work
nmap <silent><C-k> <Esc>:m -2<Return>
set clipboard=unnamed

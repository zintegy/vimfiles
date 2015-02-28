


execute pathogen#infect()

colorscheme void
syntax on

set sessionoptions-=options
set guifont=Lucida_Console
filetype indent on
filetype plugin on
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab
set nu
set scrolloff=5

set showcmd
set autoindent
set background=dark
set showmatch
set cursorline
set novisualbell

autocmd BufWinLeave .* mkview
autocmd BufWinEnter .* silent loadview 

nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf



" CTRLL is next tab

noremap <C-L> :tabnext<CR>

" CTRLH jis previous tab


noremap <C-H> :tabprevious<CR>
inoremap kj <Esc>
inoremap <Esc> <NOP>
set timeout timeoutlen=300


nnoremap <space> i

nnoremap j gj
nnoremap k gk

nnoremap <F5> :GundoToggle<CR>

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

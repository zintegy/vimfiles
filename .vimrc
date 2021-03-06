


execute pathogen#infect()

syntax on

set sessionoptions-=options
set guifont=Lucida_Console
"filetype indent on
filetype plugin on
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab
set nu
set scrolloff=5

let g:livepreview_previewer = 'evince'

colorscheme google

set showcmd
set autoindent
set showmatch
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
set timeout timeoutlen=100


nnoremap <space> i

nnoremap j gj
nnoremap k gk


nnoremap <F5> :GundoToggle<CR>


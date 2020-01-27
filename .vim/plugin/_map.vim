let mapleader = "\<Space>"

nnoremap <leader>n :nohlsearch<CR>

" buffers
nnoremap <leader>q :Bdelete<CR>
nnoremap <C-l> :bnext<CR>
nnoremap <C-h> :bprev<CR>

" windows
nnoremap <leader>w <C-w>w
nnoremap <leader>l <C-w>l
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k

" close preview window
nnoremap <C-c> :cp<CR>

" paste in insert mode
inoremap <C-p> <C-r>"

" home / end
noremap H ^
noremap L $

if exists(':tnoremap')
    tnoremap <Esc> <C-\><C-n>
    tnoremap <C-h> <C-\><C-n><C-w>h
    tnoremap <C-j> <C-\><C-n><C-w>j
    tnoremap <C-k> <C-\><C-n><C-w>k
    tnoremap <C-l> <C-\><C-n><C-w>l
endif

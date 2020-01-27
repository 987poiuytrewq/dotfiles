let g:ale_lint_on_enter = 'always'
let g:ale_lint_on_text_changed = 'always'
let g:ale_lint_on_save = 0
let g:ale_sign_error = '▶'
let g:ale_sign_warning = '▶'

let g:ale_linters = {
            \ 'javascript': ['eslint'],
            \ 'python': ['flake8'],
            \ }
let g:ale_fixers = {
            \ 'javascript': ['prettier', 'eslint'],
            \ 'json': 'prettier',
            \ 'python': ['yapf', 'isort']
            \ }

highlight! ALEErrorSign ctermfg=1 ctermbg=10 guifg=#ff2222 guibg=#202020
highlight! ALEError ctermbg=1 ctermfg=10 guibg=#ff2222 guifg=#202020
highlight! ALEWarningSign ctermfg=3 ctermbg=10 guifg=#bbbb00 guibg=#202020
highlight! ALEWarning ctermbg=3 ctermfg=10 guibg=#bbbb00 guifg=#202020

augroup format
    autocmd!
    autocmd BufLeave,BufUnload,BufHidden,WinLeave,FocusLost * silent! ALEFix
augroup END

nnoremap ]e :ALENext<CR>
nnoremap [e :ALEPrevious<CR>
nnoremap <leader>= :ALEFix<CR>

colorscheme base16-vivid

set t_Co=256
set background=dark
set hlsearch
set fillchars=vert:\ ,fold:\ ,diff:\ ,
let g:colorscheme_switcher_exclude_builtins = 1
let python_highlight_all = 1
let g:vim_markdown_frontmatter = 1

if has('nvim')
    set termguicolors
endif

augroup colors
    autocmd!
    autocmd ColorScheme,VimEnter,SourcePre * highlight! EndOfBuffer cterm=none ctermfg=234 ctermbg=234 gui=none guifg=#101010 guibg=#101010
    autocmd ColorScheme,VimEnter,SourcePre * highlight! DiffAdd guifg=none guibg=#002000
    autocmd ColorScheme,VimEnter,SourcePre * highlight! DiffChange guifg=none guibg=none
    autocmd ColorScheme,VimEnter,SourcePre * highlight! DiffText guifg=none guibg=#000020
    autocmd ColorScheme,VimEnter,SourcePre * highlight! DiffDelete guifg=none guibg=#200000
    autocmd FileType javascript,javascript.jsx :JsPreTmpl scss<CR>
augroup END

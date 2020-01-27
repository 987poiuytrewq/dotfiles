highlight! Folded ctermfg=none ctermbg=235
set foldmethod=syntax
set foldenable
set foldlevelstart=99
function! FoldText()
    return substitute(getline(v:foldstart), '^.', '▶', '') . ' ... ' .
                \ substitute(getline(v:foldend), '^\s*', '', '')
endfunction
set foldtext=FoldText()

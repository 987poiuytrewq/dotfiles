let has_textchanged = v:version > 704 || (v:version == 704 && has('patch126'))

augroup autosave
    autocmd!
    autocmd InsertLeave * nested update
    if has_textchanged
        autocmd TextChanged * nested update
    endif
augroup END

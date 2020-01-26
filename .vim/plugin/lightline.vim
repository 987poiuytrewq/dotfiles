set noshowmode

let g:lightline#colorscheme#base16_inactive#palette = g:lightline#colorscheme#base16#palette
let g:lightline#colorscheme#base16_inactive#palette.inactive.middle = [ [ '#585858', '#282828', 8, 18 ] ]

function! LightlineMode()
    return lightline#mode()
endfunction

function! LightlineReadonly()
    return &readonly ? '' : ''
endfunction

function! LightlineFilename()
    return @%
endfunction

function! LightlineFugitive()
    if exists('*fugitive#head')
        let branch = fugitive#head()
        return branch !=# '' ? ' '.branch : ''
    endif
    return 'not git'
endfunction

let g:lightline = {
            \ 'colorscheme': 'base16_inactive',
            \ 'subseparator': { 'left': '', 'right': '' },
            \ 'active': {
            \   'left': [
            \     [ 'mode', 'paste' ],
            \     [ 'fugitive'],
            \     [ 'readonly', 'filename' ],
            \   ],
            \  'right': [],
            \ },
            \ 'inactive': {
            \   'left': [
            \     [],
            \     [],
            \     [ 'readonly', 'filename' ],
            \   ],
            \  'right': [],
            \ },
            \ 'component_function': {
            \   'mode': 'LightlineMode',
            \   'readonly': 'LightlineReadonly',
            \   'filename': 'LightlineFilename',
            \   'fugitive': 'LightlineFugitive',
            \ },
            \ }

set noshowmode

let g:lightline#colorscheme#base16_inactive#palette = g:lightline#colorscheme#base16#palette
let g:lightline#colorscheme#base16_inactive#palette.inactive.middle = [ [ '#585858', '#282828', 8, 18 ] ]

function! LightlineReadonly()
    return &readonly ? '' : ''
endfunction

function! LightlineFilename()
    return @%
endfunction

function! LightlineGitBranch()
  let branch = FugitiveHead()
  return branch !=# '' ? ' '.branch : ''
endfunction

let g:lightline = {
            \ 'colorscheme': 'base16_inactive',
            \ 'subseparator': { 'left': '', 'right': '' },
            \ 'active': {
            \   'left': [
            \     [ 'mode', 'paste' ],
            \     [ 'gitbranch'],
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
            \   'readonly': 'LightlineReadonly',
            \   'filename': 'LightlineFilename',
            \   'gitbranch': 'LightlineGitBranch',
            \ },
            \ }

let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_semantic_triggers = {
            \ 'css': ['re!^\s{2}', 're!:\s+'],
            \ 'scss': ['re!^\s{2}', 're!:\s+'],
            \ }
set completeopt-=preview

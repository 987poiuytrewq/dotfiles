nnoremap <leader>f :<C-u>Denite -start-filter file/rec<CR>
nnoremap <leader>b :<C-u>Denite buffer<CR>
nnoremap <leader>t :<C-u>Denite -start-filter tag<CR>
nnoremap <leader>/ :<C-u>Denite -start-filter grep:::!<CR>
nnoremap <leader># :<C-u>DeniteCursorWord grep<CR>
nnoremap <leader>g :<C-u>Denite -resume grep<CR>

call denite#custom#option('default', {
      \ 'highlight_matched_range': 'Normal',
      \ 'highlight_matched_char': 'Title',
      \ 'highlight_mode_normal': 'PmenuSel',
      \ 'highlight_mode_insert': 'Normal',
      \ 'filter_split_direction': 'below',
      \ 'matcher': 'matcher/fuzzy',
      \ 'prompt': '',
      \ 'short_source_names': v:true,
      \ 'smartcase': v:true,
      \ 'sorters': 'sorter/sublime',
      \ 'split': 'no',
      \ 'statusline': v:false
      \ })


call denite#custom#var('file/rec', 'command',
      \ ['rg', '--files', '--glob', '!.git', '--hidden'])

call denite#custom#var('grep', 'command', ['rg'])
call denite#custom#var('grep', 'default_opts',
      \ ['--hidden', '--vimgrep', '--no-heading', '-S'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

nnoremap <leader>f :<C-u>Denite file_rec<CR>
nnoremap <leader>b :<C-u>Denite buffer<CR>
nnoremap <leader>t :<C-u>Denite tag<CR>
nnoremap <leader>o :<C-u>Denite outline<CR>
nnoremap <leader>/ :<C-u>Denite -mode=normal grep<CR>
nnoremap <leader># :<C-u>DeniteCursorWord -mode=normal grep<CR>
nnoremap <leader>g :<C-u>Denite -mode=normal -resume grep<CR>

call denite#custom#option('default', {
      \ 'highlight_matched_range': 'Normal',
      \ 'highlight_matched_char': 'Title',
      \ 'highlight_mode_normal': 'PmenuSel',
      \ 'highlight_mode_insert': 'Normal',
      \ 'split': 'no',
      \ 'smartcase': v:true,
      \ 'sorters': 'sorter_sublime',
      \ 'prompt': '',
      \ 'short_source_names': v:true,
      \ 'statusline': v:false
      \ })

call denite#custom#map('insert', '<Esc>', '<denite:enter_mode:normal>', 'noremap')
call denite#custom#map('normal', '<Esc>', '<NOP>', 'noremap')
call denite#custom#var('file_rec', 'command',
      \ ['rg', '--files', '--glob', '!.git', '--hidden'])
call denite#custom#var('grep', 'command', ['rg'])
call denite#custom#var('grep', 'default_opts',
      \ ['--hidden', '--vimgrep', '--no-heading', '-S'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

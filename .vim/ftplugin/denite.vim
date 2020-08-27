nnoremap <buffer><expr> <CR> denite#do_map('do_action')
nnoremap <buffer><expr> d denite#do_map('do_action', 'delete')
nnoremap <buffer><expr> q denite#do_map('quit')
nnoremap <buffer><expr> i denite#do_map('open_filter_buffer')

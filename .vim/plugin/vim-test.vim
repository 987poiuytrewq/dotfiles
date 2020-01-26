nnoremap <C-t> :TestNearest<CR>
command! Test :TestNearest()<CR>
let test#python#pytest#options = {
            \ 'nearest': '-svv --pdb',
            \ 'file': '-vv',
            \ 'suite': '-vv -n auto --pdb',
            \ }
let test#ruby#cucumber#executable = "behave"

if has('nvim')
  let test#strategy = 'neoterm'
end

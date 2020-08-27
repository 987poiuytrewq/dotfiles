nnoremap <C-t> :TestNearest<CR>
command! Test :TestNearest()<CR>
let test#python#pytest#options = {
            \ 'nearest': '-svv --pdb',
            \ 'file': '-vv',
            \ 'suite': '-vv -n auto --pdb',
            \ }

let test#ruby#cucumber#executable = "behave"

let test#csharp#xunit#executable = "dotnet test"
let test#csharp#dotnettest#executable = "dotnet test"

if has('nvim')
  let test#strategy = 'neoterm'
end

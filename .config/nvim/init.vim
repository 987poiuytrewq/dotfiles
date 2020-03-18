set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
if !exists('g:vscode')
  source ~/.vimrc
end

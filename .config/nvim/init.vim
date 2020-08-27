set runtimepath^=~/.vim
let &packpath=&runtimepath
if !exists('g:vscode')
  source ~/.vimrc
end

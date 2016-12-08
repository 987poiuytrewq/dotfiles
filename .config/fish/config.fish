set -gx EDITOR nvim

set -gx NVM_DIR ~/.nvm
function nvm
  bass source "$NVM_DIR/nvm.sh" ';' nvm $argv
end

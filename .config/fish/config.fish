set -gx TERM xterm-256color

set fisher_home ~/.local/share/fisherman
set fisher_config ~/.config/fisherman
source $fisher_home/config.fish

set bundler_plugin_execs foreman

set -gx PATH $PATH ~/projects/chef/bin
source ~/projects/chef/env.fish

set -gx PATH $PATH ~/.rbenv/bin
source (rbenv init - | psub)

set -gx NVM_DIR ~/.nvm
function nvm
  bass source "$NVM_DIR/nvm.sh" ';' nvm $argv
end

eval (direnv hook fish)

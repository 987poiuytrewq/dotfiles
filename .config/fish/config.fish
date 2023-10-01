set -gx EDITOR nvim
set -gx GPG_TTY (tty)
source $__fish_config_dir/env.fish
direnv hook fish | source

function rename
    for SOURCE in $argv[2..-1]
        set DESTINATION (echo $SOURCE | sed $argv[1])
        if [ $SOURCE != $DESTINATION ]
            mv $SOURCE $DESTINATION
            echo "renamed $SOURCE to $DESTINATION"
        end
    end
end

function .git -w git
    git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $argv
end

function op-ra
    set -gx OP_SESSION_ra_dev (op signin --raw ra_dev)
end


# pyenv init
if command -v pyenv 1>/dev/null 2>&1
  pyenv init - | source
end

set -gx EDITOR nvim
set -gx NPM_TOKEN 7f36e649-d53b-4fa1-880e-8a63f091908a
set -gx GPG_TTY (tty)
direnv hook fish | source
# eval (python -m virtualfish auto_activation)

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

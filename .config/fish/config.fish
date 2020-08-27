set -gx EDITOR nvim
set -gx GPG_TTY (tty)
source $__fish_config_dir/env.fish
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

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f /Users/duncan/projects/scratch/MoonMail/webhooks-microservice/node_modules/tabtab/.completions/serverless.fish ]; and . /Users/duncan/projects/scratch/MoonMail/webhooks-microservice/node_modules/tabtab/.completions/serverless.fish
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[ -f /Users/duncan/projects/scratch/MoonMail/webhooks-microservice/node_modules/tabtab/.completions/sls.fish ]; and . /Users/duncan/projects/scratch/MoonMail/webhooks-microservice/node_modules/tabtab/.completions/sls.fish
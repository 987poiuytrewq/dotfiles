set -gx EDITOR nvim

eval (python -m virtualfish)

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

function box -w vagrant
    pushd ~/projects/scp/devops/devbox/
    ./box $argv
    popd
end

function scpcurl -w curl
    if [ -z $TOKEN ]
        # get -p 'username:' | read USER
        set USER 'developers+alice_admin@supercarers.com'
        set PASS alice
        # set USER duncan.williams@supercarers.com
        # get -s -p 'password:' | read PASS
        curl -sL \
            -H "Accept: application/json" \
            -H "Content-Type: application/json" \
            -d "{\"username\": \"$USER\", \"password\": \"$PASS\"}" \
            -X POST \
            api.scp/v1/auth/ | read -z AUTH
            # https://api.supercarers.com/v1/auth/ | read -z AUTH
        echo $AUTH | jq .
        echo $AUTH | jq -r '.data.access_token' | read -gx TOKEN
    end

    curl -sL \
        -H "Accept: application/json" \
        -H "Content-Type: application/json" \
        -H "Authorization: JWT $TOKEN" \
        $argv | jq .
end

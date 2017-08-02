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

function scp-dev-curl -w curl
    if [ -z $DEV_TOKEN ]
        # set DEV_USER 'developers+alice_admin@supercarers.com'
        # set DEV_PASS alice
        set DEV_USER duncan.williams@supercarers.com
        get -s -p 'password:' | read DEV_PASS
        curl -sL \
            -H "Accept: application/json" \
            -H "Content-Type: application/json" \
            -d "{\"username\": \"$DEV_USER\", \"password\": \"$DEV_PASS\"}" \
            -X POST \
            api.scp/v1/auth/ | read -z DEV_AUTH
        echo $DEV_AUTH | jq .
        echo $DEV_AUTH | jq -r '.data.access_token' | read -gx DEV_TOKEN
    end

    curl -sL \
        -H "Accept: application/json" \
        -H "Content-Type: application/json" \
        -H "Authorization: JWT $DEV_TOKEN" \
        $argv | jq .
end

function scp-prod-curl -w curl
    if [ -z $PROD_TOKEN ]
        set PROD_USER duncan.williams@supercarers.com
        get -s -p 'password:' | read PROD_PASS
        curl -sL \
            -H "Accept: application/json" \
            -H "Content-Type: application/json" \
            -d "{\"username\": \"$PROD_USER\", \"password\": \"$PROD_PASS\"}" \
            -X POST \
            https://api.supercarers.com/v1/auth/ | read -z PROD_AUTH
        echo $PRDO_AUTH | jq .
        echo $PROD_AUTH | jq -r '.data.access_token' | read -gx PROD_TOKEN
    end

    curl -sL \
        -H "Accept: application/json" \
        -H "Content-Type: application/json" \
        -H "Authorization: JWT $PROD_TOKEN" \
        $argv | jq .
end

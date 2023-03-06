#!/usr/bin/env bash

function checkTool() {
    if ! command -v $1 &>/dev/null; then
        echo "$1 could not be found"
        exit_abnormal
    fi
    echo $1 found
}

function insertVariables() {
    for key in "${!PREPARE[@]}"; do
        DATA=${PREPARE[${key}]}
        if [[ ! -z ${DATA} ]]; then
            ESCAPED_REPLACE=$(printf '%s\n' "$DATA" | sed -e 's/[\/&]/\\&/g')
            sed -i -e "s/PREPARE_${key}/${ESCAPED_REPLACE}/g" $1
        fi
    done
}

function exit_abnormal() { # Function: Exit with error.
    echo exit_abnormal
    usage
    exit 1
}

declare -A PREPARE
source ./bin/config.sh

insertVariables ./.gitlab-ci.yml
insertVariables ./bin/ci-deploy.sh
insertVariables ./bin/down_sync.sh

if [ -x ./config/sites/PREPARE_projectname ]; then
    mv ./.ddev/config.yaml.dist ./.ddev/config.yaml
fi
insertVariables ./.ddev/config.yaml

if [ -d ./config/sites/PREPARE_projectname ]; then
    mv ./config/sites/PREPARE_projectname ./config/sites/${PREPARE[projectname]}
fi
insertVariables ./config/sites/${PREPARE[projectname]}/config.yaml

if [ -d ./packages/PREPARE_LOWERVENDOR_site ]; then
    mv ./packages/PREPARE_LOWERVENDOR_site ./packages/${PREPARE[PREPARE_LOWERVENDOR]}_site
fi

if [ -d ./src/PREPARE_LOWERVENDOR_site ]; then
    mv ./src/PREPARE_LOWERVENDOR_site ./src/${PREPARE[PREPARE_LOWERVENDOR]}_site
fi

if [[ ! -x ./.env ]]; then
    cp .env.dist .env
fi
insertVariables .env

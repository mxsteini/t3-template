#!/usr/bin/env bash

export PATH="$HOMEBREW_PREFIX/opt/gnu-sed/libexec/gnubin:$PATH"

function insertVariables() {
    echo working on $1
    for key in "${!PREPARE[@]}"; do
        DATA=${PREPARE[${key}]}
        if [[ ! -z ${DATA} ]]; then
            ESCAPED_REPLACE=$(printf '%s\n' "$DATA" | sed -e 's/[\/&]/\\&/g')
            sed -i -e "s/PREPARE_${key}/${ESCAPED_REPLACE}/g" $1
        fi
    done
}

function removeVariables() {
    for key in "${!PREPARE[@]}"; do
        DATA=${PREPARE[${key}]}
        if [[ ! -z ${DATA} ]]; then
            ESCAPED_REPLACE=$(printf '%s\n' "$DATA" | sed -e 's/[\/&]/\\&/g')
            sed -i -e "s/${ESCAPED_REPLACE}/PREPARE_${key}/g" $1
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

if [ -z $1 ]; then
    command=""
else
    command="$1"
fi

if [ "$command" == 'rollback' ]; then
    removeVariables ./.gitlab-ci.yml
    removeVariables ./bin/ci-deploy.sh
    removeVariables ./bin/base.sh
    removeVariables ./bin/down_sync.sh

    removeVariables ./.ddev/config.yaml
    mv ./.ddev/config.yaml ./.ddev/config.yaml.dist

    removeVariables ./config/sites/${PREPARE[projectname]}/config.yaml
    mv ./config/sites/${PREPARE[projectname]} ./config/sites/PREPARE_projectname

    for f in $(find ./packages/${PREPARE[LOWERVENDOR]}_site -type f); do
        removeVariables $f
    done
    mv ./packages/${PREPARE[LOWERVENDOR]}_site ./packages/PREPARE_LOWERVENDOR_site

    for f in $(find ./src/${PREPARE[LOWERVENDOR]}_site -type f); do
        removeVariables $f
    done
    mv ./src/${PREPARE[LOWERVENDOR]}_site ./src/PREPARE_LOWERVENDOR_site

    removeVariables .env
    removeVariables composer.json
    removeVariables package.json
    mv .env .env.dist

    rm ./public/typo3conf/LocalConfiguration.php

else

    insertVariables ./.gitlab-ci.yml
    insertVariables ./bin/ci-deploy.sh
    insertVariables ./bin/base.sh
    insertVariables ./bin/down_sync.sh

    if [ -x ./config/sites/PREPARE_projectname ]; then
        mv ./.ddev/config.yaml.dist ./.ddev/config.yaml
    fi
    insertVariables ./.ddev/docker-compose.browsersync.yaml
    insertVariables ./.ddev/config.yaml

    if [ -d ./config/sites/PREPARE_projectname ]; then
        mv ./config/sites/PREPARE_projectname ./config/sites/${PREPARE[projectname]}
    fi
    insertVariables ./config/sites/${PREPARE[projectname]}/config.yaml

    if [ -d ./packages/PREPARE_LOWERVENDOR_site ]; then
        mv ./packages/PREPARE_LOWERVENDOR_site ./packages/${PREPARE[LOWERVENDOR]}_site
    fi
    for f in $(find ./packages/${PREPARE[LOWERVENDOR]}_site -type f); do
        insertVariables $f
    done

    if [ -d ./src/PREPARE_LOWERVENDOR_site ]; then
        mv ./src/PREPARE_LOWERVENDOR_site ./src/${PREPARE[LOWERVENDOR]}_site
    fi
    for f in $(find ./src/${PREPARE[LOWERVENDOR]}_site -type f); do
        insertVariables $f
    done

    if [[ ! -x ./.env ]]; then
        cp .env.dist .env
    fi
    insertVariables .env

    if [[ ! -x ./config/system/settings.php ]]; then
        cp ./config/system/settings.php.dist ./config/system/settings.php
    fi
    insertVariables ./config/system/settings.php

    if [[ ! -x ./composer.json ]]; then
        cp ./composer.json.dist ./composer.json
    fi
    insertVariables composer.json

    if [[ ! -x ./package.json ]]; then
        cp ./package.json.dist ./package.json
    fi
    insertVariables package.json
    insertVariables db/sys_template.sql
fi

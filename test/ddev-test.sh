#!/usr/bin/env bash

### boilerplate from http://codeacumen.info/posts/bulletproof-bash-redux/
#export PATH=/usr/bin:/bin:/usr/sbin:/sbin
umask 2

ME=${0##*/}
exec 3>&2 >>ddev-test.log 2>&1
set -xveu
date
hostname

WORKING_DIR=$(pwd)
TEST_DIR=$(pwd)/ddev-test

end() {
    [[ $? = 0 ]] && return
    cd "$WORKING_DIR"
    echo FAILED - tail ./ddev-test.log >&3
    echo "file an issue on https://github.com/mxsteini/t3-template/issues"
    exit 1
}
trap end EXIT

if [ -z $@ ]; then
    command="all"
else
    command="$@"
fi

if [ "$command" == 'cleanup' ] || [ "$command" == 'all' ]; then
    if [ -d "$TEST_DIR" ]; then
        echo cleaning up old test >&3
        pushd "$TEST_DIR"
        echo delete ddev >&3
        ddev delete -Oy
        popd
        rm -rf "$TEST_DIR"
    fi
fi

if [ "$command" == 'rsync' ] || [ "$command" == 'all' ]; then
    echo rsync >&3
    params='--delete --recursive --links --perms --times --group --owner --devices --verbose --itemize-changes'
    exclude='--exclude=.git --exclude=test'
    rsync ${params} ${exclude} ../ "$TEST_DIR"/
fi
if [ "$command" == 'prepare' ] || [ "$command" == 'all' ]; then
    cd "$TEST_DIR"
    echo prepare >&3
    cp bin/config.sh.dist bin/config.sh
    bin/prepare.sh
fi
if [ "$command" == 'ddev' ] || [ "$command" == 'all' ]; then
    cd "$TEST_DIR"
    echo start ddev >&3
    ddev start
fi
if [ "$command" == 'import' ] || [ "$command" == 'all' ]; then
    cd "$TEST_DIR"
    echo import database >&3
    ddev import-db --src=db/prepare.sql.gz
fi
if [ "$command" == 'npm' ] || [ "$command" == 'all' ]; then
    cd "$TEST_DIR"
    echo run npm >&3
    rm -rf t3-build
#    cp -ar ../../../t3-build .
#    ddev npm i ./t3-build
    ddev npm i t3-build
    ddev npm i alpinejs
    ddev npm i @alpinejs/collapse
    ddev npm run build
fi
if [ "$command" == 'composer' ] || [ "$command" == 'all' ]; then
    cd "$TEST_DIR"
    echo run composer >&3
    ddev composer install
fi

if [ "$command" == 'open' ] || [ "$command" == 'all' ]; then
    cd "$TEST_DIR"
    . ./.env
    echo "open typo3 frontend:" >&3
    echo "https://$T3BUILD_BRWOSERSYNC_TYPO3_HOST" >&3
    echo "" >&3
    echo "open typo3 backend (user: prepare / password: prepare):" >&3
    echo "https://$T3BUILD_BRWOSERSYNC_TYPO3_HOST/typo3" >&3
    echo "" >&3
    echo "open browsersync (wait for it):" >&3
    echo "https://$T3BUILD_BRWOSERSYNC_TYPO3_HOST:$T3BUILD_BRWOSERSYNC_TYPO3_PORT" >&3
    echo "" >&3
fi

if [ "$command" == 'cert' ] || [ "$command" == 'all' ]; then
    cd "$TEST_DIR"
    mkdir -p ./var/certs
    . ./.env && mkcert $T3BUILD_BRWOSERSYNC_STANDALONE_HOST && mv ./*.pem var/certs
fi

if [ "$command" == 'start' ] || [ "$command" == 'all' ]; then
    cd "$TEST_DIR"
    echo "nearly done" >&3
    cp ./vendor/typo3/cms-install/Resources/Private/FolderStructureTemplateFiles/root-htaccess public/.htaccess
    ddev exec vendor/bin/typo3 database:import < db/sys_template.sql
    ddev exec vendor/bin/typo3 install:fixfolderstructure
    ddev npm start  >&3
fi

if [ "$command" == 'standalone' ]; then
    cd "$TEST_DIR"
    npm run standalone  >&3
fi

if [ "$command" == 't3' ]; then
    cd "$TEST_DIR"
    rm -rf t3-build
    cp -ar ../../../t3-build .
    ddev npm i ./t3-build
fi

if [ "$command" == 'export' ]; then
    cd "$TEST_DIR"
    ddev export-db --file=../../db/prepare.sql.gz
fi


cd "$WORKING_DIR"
trap - EXIT
exit 0

#mkdir -p ./var/certs
#. ./.env && mkcert $T3BUILD_BRWOSERSYNC_TYPO3_HOST && mv ./*.pem var/certs
#. ./.env && mkcert $T3BUILD_BRWOSERSYNC_STANDALONE_HOST && mv ./*.pem var/certs
#npm start >&3

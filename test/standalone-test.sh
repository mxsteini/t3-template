#!/usr/bin/env bash

### boilerplate from http://codeacumen.info/posts/bulletproof-bash-redux/
#export PATH=/usr/bin:/bin:/usr/sbin:/sbin
umask 2

ME=${0##*/}
exec 3>&2 >>standalone-test.log 2>&1
set -xveu
date
hostname

WORKING_DIR=$(pwd)
TEST_DIR=$(pwd)/standalone-test

end() {
    [[ $? = 0 ]] && return
    cd "$WORKING_DIR"
    echo FAILED - tail -50 ./standalone-test.log >&3
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

if [ "$command" == 'npm' ] || [ "$command" == 'all' ]; then
    cd "$TEST_DIR"
    echo run npm >&3
    rm -rf t3-build
#    cp -ar ../../../t3-build .
#    npm i ./t3-build
    npm i t3-build
    npm i alpinejs
    npm i @alpinejs/collapse
    npm run build
fi

if [ "$command" == 'cert' ] || [ "$command" == 'all' ]; then
    cd "$TEST_DIR"
    mkdir -p ./var/certs
    . ./.env && mkcert $T3BUILD_BRWOSERSYNC_STANDALONE_HOST && mv ./*.pem var/certs
fi

if [ "$command" == 'open' ] || [ "$command" == 'all' ]; then
    cd "$TEST_DIR"
    . ./.env
    echo "" >&3
    echo "open browsersync (wait for it):" >&3
    echo "https://$T3BUILD_BRWOSERSYNC_STANDALONE_HOST:$T3BUILD_BRWOSERSYNC_STANDALONE_PORT" >&3
    echo "" >&3
fi

if [ "$command" == 'start' ] || [ "$command" == 'all' ]; then
    cd "$TEST_DIR"
    echo "nearly done" >&3
    npm run standalone  >&3
fi

if [ "$command" == 't3' ]; then
    cd "$TEST_DIR"
    rm -rf t3-build
    cp -ar ../../../t3-build .
    npm i ./t3-build
fi

cd "$WORKING_DIR"
trap - EXIT
exit 0

#mkdir -p ./var/certs
#. ./.env && mkcert $T3BUILD_BRWOSERSYNC_TYPO3_HOST && mv ./*.pem var/certs
#. ./.env && mkcert $T3BUILD_BRWOSERSYNC_STANDALONE_HOST && mv ./*.pem var/certs
#npm start >&3

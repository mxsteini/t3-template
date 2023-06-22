#!/usr/bin/env bash

### boilerplate from http://codeacumen.info/posts/bulletproof-bash-redux/
#export PATH=/usr/bin:/bin:/usr/sbin:/sbin
umask 2

ME=${0##*/}
exec 3>&2 >> test.log 2>&1
set -xveu
date
hostname

end() { [[ $? = 0 ]] && return; echo FAILED - look at test.log >&3; exit 1; }
trap end EXIT

if [ -d ./temp ]; then
    echo cleaning up old test >&3
    pushd temp
    echo delete ddev >&3
    ddev delete -Oy
    popd
    rm -rf temp
fi

echo rsync >&3
params='--delete --recursive --links --perms --times --group --owner --devices --verbose --itemize-changes'
exclude='--exclude=.git --exclude=test'
rsync ${params} ${exclude} ../ temp/
pushd temp
echo prepare >&3
cp bin/config.sh.dist bin/config.sh
bin/prepare.sh
echo start ddev >&3
ddev start
echo import database >&3
ddev import-db --src=db/prepare.sql.gz
echo run npm >&3
npm i t3-build
npm i alpinejs
npm i @alpinejs/collapse
npm run build
echo run composer >&3
ddev composer install
echo "nearly done" >&3
cp ./vendor/typo3/cms-install/Resources/Private/FolderStructureTemplateFiles/root-htaccess public/.htaccess
ddev exec vendor/bin/typo3 database:import < db/sys_template.sql
mkdir -p ./var/certs
. ./.env && mkcert $T3BUILD_BRWOSERSYNC_TYPO3_HOST && mv ./*.pem var/certs
. ./.env && mkcert $T3BUILD_BRWOSERSYNC_STANDALONE_HOST && mv ./*.pem var/certs
npm start >&3
popd

trap - EXIT
exit 0

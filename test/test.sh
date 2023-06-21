#!/usr/bin/env bash
if [ -d ./temp ]; then
    pushd temp
    ddev delete -Oy
    popd
    rm -rf temp
fi

params='--delete --recursive --links --perms --times --group --owner --devices --verbose --itemize-changes'
exclude='--exclude=.git --exclude=test'
rsync ${params} ${exclude} ../ temp/

pushd temp
cp bin/config.sh.dist bin/config.sh
bin/prepare.sh
ddev start
ddev import-db --src=db/prepare.sql.gz
npm i t3-build
npm i alpinejs
npm i @alpinejs/collapse
npm run build
ddev composer install
cp ./vendor/typo3/cms-install/Resources/Private/FolderStructureTemplateFiles/root-htaccess public/.htaccess
ddev exec vendor/bin/typo3 database:import < db/sys_template.sql
mkdir -p ./var/certs
. ./.env && mkcert $T3BUILD_BRWOSERSYNC_TYPO3_HOST && mv ./*.pem var/certs
. ./.env && mkcert $T3BUILD_BRWOSERSYNC_STANDALONE_HOST && mv ./*.pem var/certs
popd
npm start

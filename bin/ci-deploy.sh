#!/bin/bash
. bin/base.sh

# set -o errexit

current_release_dir="$(silent_ssh "readlink -f $current_link")"
current_dir="${current_release_dir##*/}"

next_dir="$(silent_ssh "readlink -f $next_link")"
next_dir="${next_dir##*/}"

previous_dir=$(silent_ssh "readlink -f $previous_link")
previous_dir="${previous_dir##*/}"

params='--recursive --links --perms --times --group --owner --devices --verbose  --checksum-z --hard-links'
params='--recursive --links --perms --ignore-times --group --owner --devices --verbose'
# more_params='--no-perms --no-owner'
exclude='--exclude=**/doc --exclude=LocalConfiguration* --exclude=PackageStates.php --exclude=public/uploads --exclude=var --exclude=current/robots.txt --exclude=**/FIRST_INSTALL --exclude=**/ENABLE_INSTALL_TOOL --exclude=**/typo3temp --exclude=**/fileadmin --exclude=**/user_upload --exclude=**/_processed_ --exclude=**/Gulp --exclude=**/.sass-cache/** --exclude=**/Scss/** --exclude=**/Private/JavaScripts/** --exclude=*.map'
# [ -d "$next_link" ] && rsync ${params} ${mode} ${more_params} ${exclude} ${current_link}/ ${next_release_dir}/ || mkdir -p $next_release_dir

silent_ssh "install -dv $next_release_dir"

params='--delete --recursive --links --perms --times --group --owner --devices --verbose --itemize-changes'
if [ "$loginuser" != "$user" ]; then
  params="${params} --chown=${user}:${group}"
fi
exclude='--exclude=var --exclude=**/FIRST_INSTALL --exclude=**/ENABLE_INSTALL_TOOL --exclude=**/Documentation --exclude=**/typo3temp --exclude=**/fileadmin --exclude=**/user_upload --exclude=**/_processed_ --exclude=*.map --exclude=**/.git --exclude=**/.ddev --exclude=**/.github --exclude=**/.DS_Store'
# rsync --delete ${params} ${mode} ${more_params} ${exclude} --compare-dest=$user@$host:$current_link/ $build_dir/typo3/ $user@$host:$next_release_dir/
#echo --delete ${params} ${more_params} ${exclude} --link-dest=${current_dir}/public/ ${build_dir}/public/ ${loginuser}@${host}:${next_release_dir}/public/
unset folder
for folder in config public vendor packages; do
    ${RSYNC} ${params} ${more_params} ${exclude} --link-dest=${current_release_dir}/$folder/ ${build_dir}/$folder/ ${loginuser}@${host}:${next_release_dir}/$folder/
done

silent_ssh "ls $shared_dir/configuration/LocalConfiguration.php"

if [ "$?" -ne 0 ]; then
  log.error "##############################################################"
  log.error "more configuration is needed! Edit LocalConfiguration.php.dist and rename it to LocalConfiguration.php"
  ${RSYNC} ${build_dir}/public/typo3conf/LocalConfiguration.php.dist ${loginuser}@${host}:${shared_dir}/configuration/
  ${RSYNC} ${build_dir}/.env.dist ${loginuser}@${host}:${shared_dir}/configuration/
  ${RSYNC} ${build_dir}/db/db.sql ${loginuser}@${host}:${shared_dir}/
  echo cp ${shared_dir}/configuration/LocalConfiguration.php.dist ${shared_dir}/configuration/LocalConfiguration.php
  echo vi ${shared_dir}/configuration/LocalConfiguration.php
  echo cp ${shared_dir}/configuration/.env.dist ${next_link}/.env
  echo vi ${next_link}/.env
  echo ${next_link}/vendor/bin/typo3cms database:import < ${shared_dir}/db.sql
  exit 1
fi

silent_ssh "ls ${loginuser}@${host}:${shared_dir}/db.sql"
if [ "$?" -ne 0 ]; then
  log.error "##############################################################"
  log.error "provide default database"
  ${RSYNC} ${build_dir}/db/db.sql ${loginuser}@${host}:${shared_dir}/
fi


silent_ssh "ls $next_link/.env"

if [ "$?" -ne 0 ]; then
  log.error "##############################################################"
  log.error "more configuration is needed! Edit .env.dist and rename it to .env"
  ${RSYNC} ${build_dir}/.env.dist ${loginuser}@${host}:${shared_dir}/configuration/
  echo cp ${shared_dir}/configuration/.env.dist ${next_link}/.env
  echo vi ${next_link}/.env
  exit 1
fi


silent_ssh << EOF
cp "$next_link/.env" "$next_release_dir/.env"
ln -snvf ${next_release_dir} $next_link
cd ${next_link}/public
relative_public=\$(realpath --relative-to=${next_release_dir}/public ${shared_dir}/public)
for folder in \$(ls ${shared_dir}/public/); do
  ln -svnf \${relative_public}/\$folder
done
relative_configuration=\$(realpath --relative-to=${next_release_dir}/public/typo3conf ${shared_dir}/configuration)
ln -svnf \${relative_configuration}/LocalConfiguration.php typo3conf/LocalConfiguration.php
cd ${next_link}
TYPO3_CONTEXT=${TYPO3_CONTEXT} ${php_bin} vendor/bin/typo3cms install:fixfolderstructure
TYPO3_CONTEXT=${TYPO3_CONTEXT} ${php_bin} vendor/bin/typo3cms database:updateschema
#TYPO3_CONTEXT=${TYPO3_CONTEXT} ${php_bin} vendor/bin/cachetool opcache:reset --fcgi="${fpm_socket}"
TYPO3_CONTEXT=${TYPO3_CONTEXT} ${php_bin} vendor/bin/typo3cms cache:flush
# TYPO3_CONTEXT=${TYPO3_CONTEXT} ${php_bin} vendor/bin/typo3cms cache:warmup
cd ${releases_dir}
ls -dt release* | grep -v "${next_dir}" | grep -v "${current_dir}" | grep -v "${previous_dir}" | tail -n +4 | xargs rm -rf --
EOF

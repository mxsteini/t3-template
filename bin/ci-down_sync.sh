#!/bin/bash
set -o errexit
. bin/ci-base.sh

log.log "rsync"
params='--delete --recursive --links --perms --times --group --owner --devices --verbose --itemize-changes'
exclude='--exclude=var --exclude=**/FIRST_INSTALL --exclude=**/ENABLE_INSTALL_TOOL --exclude=**/Documentation --exclude=**/_temp_ --exclude=**/_processed_ --exclude=*.map'

unset folder
for folder in "public/fileadmin" "public/uploads"; do
    log.log "rsync $folder"
     silent_ssh_stage "rsync ${params} ${more_params} ${exclude} ${live_shared_dir}/$folder/ ${stage_shared_dir}/$folder/"
done

log.log "import database"
silent_ssh_live "$live_php_bin $live_current_link/vendor/bin/typo3cms database:export | gzip" | ssh $stage_loginuser@$stage_host "gunzip | $stage_php_bin $stage_current_link/vendor/bin/typo3cms database:import"

exit
silent_ssh "$php_bin $current_link/vendor/bin/typo3cms database:export | gzip" >db.sql.gz

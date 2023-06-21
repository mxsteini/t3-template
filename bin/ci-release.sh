#!/bin/bash

set -o errexit

. bin/base.sh

next_dir=$(silent_ssh "readlink -f $next_link")
current_dir=$(silent_ssh "readlink -f $current_link")
previous_dir=$(silent_ssh "readlink -f $previous_link")

silent_ssh << EOC
rm -f ${previous_link}
ln -s ${current_dir} $previous_link
cd ${next_dir}
#TYPO3_CONTEXT=${TYPO3_CONTEXT} ${php_bin} vendor/bin/cachetool opcache:reset --fcgi="${fpm_socket}"
TYPO3_CONTEXT=${TYPO3_CONTEXT} ${php_bin} vendor/bin/typo3cms cache:flush
#TYPO3_CONTEXT=${TYPO3_CONTEXT} ${php_bin} vendor/bin/typo3cms cache:warmup
rm -f ${current_link}
ln -s ${next_dir} $current_link
EOC

#!/bin/bash

. bin/base.sh

silent_ssh << EOF
cd ${next_link}
TYPO3_CONTEXT=${TYPO3_CONTEXT} ${php_bin} vendor/bin/typo3cms language:update
TYPO3_CONTEXT=${TYPO3_CONTEXT} ${php_bin} vendor/bin/typo3cms cache:flush
EOF

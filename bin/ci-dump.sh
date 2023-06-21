#!/bin/bash
set -o errexit
. bin/base.sh

mkdir -p dump
rm -rf dump/*
silent_ssh "(cd ${shared_dir}; tar ${file_exclude} -czf - public/fileadmin)" > dump/fileadmin.tar.gz
silent_ssh "$php_bin $current_link/vendor/bin/typo3cms database:export | gzip" | cat > dump/db.sql.gz

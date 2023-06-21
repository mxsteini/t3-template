#!/bin/bash


[[ -f .env ]] &&  . .env

if [ "${BUILD_CONTEXT}" == 'Production' ]; then
    echo run on production!!!!
    [[ -f .env.production ]] &&  . .env.production
fi

basedir="${basedir:-}"
loginuser="${loginuser:-root}"
host="${host:-}"
user="${user:-}"
group="${group:-psacln}"
fpm_socket="${fpm_socket:-}"
TYPO3_CONTEXT=${TYPO3_CONTEXT:-Production}
RSYNC=${RSYNC:-/usr/bin/rsync}
INSTALL=${RSYNC:-/usr/bin/install}

export GITLAB_ARTIFACT_TOKEN=${GITLAB_ARTIFACT_TOKEN:-PREPARE_accesstoken}
export release_name="release-$(date +"%Y%m%d_%H%M%S")"
export shared_dir=$basedir/shared
export releases_dir=$basedir/releases
export next_release_dir=$releases_dir/$release_name
export next_link=$releases_dir/next
export current_link=$releases_dir/current
export previous_link=$releases_dir/previous
export build_dir=$(pwd)
export php_bin="PREPARE_php"
export fpm_socket=$fpm_socket
export TYPO3_CONTEXT
export BIN_NPM=${BIN_NPM:-npm}
export BIN_PHP=${BIN_PHP:-php}
export BIN_COMPOSER=${BIN_COMPOSER:-docker run --rm --user $(id -u):$(id -g) --volume $PWD:/app composer --ignore-platform-req=ext-intl --ignore-platform-req=ext-zip --ignore-platform-req=ext-sodium --ignore-platform-req=ext-bz2}
export BIN_T3CONSOLE=${BIN_T3CONSOLE:-vendor/bin/typo3cms}
export file_exclude='--exclude=var --exclude=**/FIRST_INSTALL --exclude=**/ENABLE_INSTALL_TOOL --exclude=**/Documentation --exclude=**/_temp_ --exclude=**/_processed_ --exclude=*.map'

# Color variables
red='\033[0;31m'
green='\033[0;32m'
yellow='\033[0;33m'
blue='\033[0;34m'
magenta='\033[0;35m'
cyan='\033[0;36m'
# Clear the color after that
clear='\033[0m'

function log.log() {
  echo -e "${green}$1${clear}"
}

function log.info() {
  echo -e "${yellow}$1${clear}"
}

function log.error() {
  echo -e "${red}$1${clear}"
}

# avoid banner message and other useless printouts
function su_scp() {
  if [ "$loginuser" != "$user" ]; then
    dd if="$1" status=none | ssh -oStrictHostKeyChecking=no $loginuser@$host "sudo -u $user dd of=$2 status=none"
  else
    scp -q $1 $loginuser@$host:$2
  fi
}

# avoid banner message and other useless printouts
function silent_ssh() {

  local commands="$1"

  if [ -z "$commands" ]; then
    commands=$(cat)
  fi

  # maybe on local testing
  if [ "$loginuser" != "$user" ]; then

    ssh -oStrictHostKeyChecking=no $loginuser@$host "sudo -u $user bash -e <<'EOC'
    $commands
    exit $?
EOC"
  else
    ssh -oStrictHostKeyChecking=no $loginuser@$host "$commands"

  fi
  return $?
}

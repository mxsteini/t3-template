#!/bin/bash

export release_name="release-$(date +"%Y%m%d_%H%M%S")"

export live_shared_dir=$live_basedir/shared
export live_releases_dir=$live_basedir/releases
export live_next_release_dir=$live_releases_dir/$release_name
export live_next_link=$live_releases_dir/next
export live_current_link=$live_releases_dir/current
export live_previous_link=$live_releases_dir/previous

export stage_shared_dir=$stage_basedir/shared
export stage_releases_dir=$stage_basedir/releases
export stage_next_release_dir=$stage_releases_dir/$release_name
export stage_next_link=$stage_releases_dir/next
export stage_current_link=$stage_releases_dir/current
export stage_previous_link=$stage_releases_dir/previous

export build_dir=$(pwd)

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


function silent_ssh_live() {

  local commands="$1"

  if [ -z "$commands" ]; then
    commands=$(cat)
  fi

  # maybe on local testing
  if [ "$live_loginuser" != "$live_user" ]; then
    ssh -oStrictHostKeyChecking=no $live_loginuser@$live_host "sudo -u $live_user bash -e <<'EOC'
    $commands
    exit $?
EOC"
  else
    ssh -oStrictHostKeyChecking=no $live_loginuser@$live_host "$commands"

  fi
  return $?
}

function silent_ssh_stage() {

  local commands="$1"

  if [ -z "$commands" ]; then
    commands=$(cat)
  fi

  # maybe on local testing
  if [ "$stage_loginuser" != "$stage_user" ]; then

    ssh -oStrictHostKeyChecking=no $stage_loginuser@$stage_host "sudo -u $stage_user bash -e <<'EOC'
    $commands
    exit $?
EOC"
  else
    ssh -oStrictHostKeyChecking=no $stage_loginuser@$stage_host "$commands"

  fi
  return $?
}

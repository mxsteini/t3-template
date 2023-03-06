#!/bin/bash
. bin/base.sh

if [ -z $1 ]; then
    command="all"
else
    command="$1"
fi

GITLAB_URL="https://gitlab.monobloc.de"
# https://gitlab.monobloc.de/hkg/huk/t3-template/-/settings/access_tokens
GITLAB_ACCESS_TOKEN="PREPARE_accesstoken"
# https://gitlab.monobloc.de/hkg/huk/t3-template/-/settings/ci_cd -> Pipeline triggers
GITLAB_PIPELINE_TOKEN="PREPARE_pipelinetoken"

project="t3-template"
project_id=PREPARE_projectid
branch="dump"
job="dump-data"
outZipFile="$project.zip"
outHeadersFile="$outZipFile.httpheaders"

if [ "$command" == 'trigger' ] || [ "$command" == 'all' ]; then
    log.log "trigger dump"
    jobjson=$(curl -X POST --silent \
        -F token=$GITLAB_PIPELINE_TOKEN \
        -F "ref=production" \
        -F "variables[ONLY_MANUELL]=1" \
        "$GITLAB_URL/api/v4/projects/$project_id/trigger/pipeline")

    jobid=$(echo $jobjson | jq '.["id"]')

    status="sleeping"
    sp="/-\|"
    log.log "wating for job $jobid"
    while true; do
        status=$(curl --silent --header "PRIVATE-TOKEN: $GITLAB_ACCESS_TOKEN" "$GITLAB_URL/api/v4/projects/$project_id/pipelines/$jobid" | jq '.["status"]' | tr -d '"')
        printf "\rjob: $status ${sp:i++%${#sp}:1}"
        if [ $status == "canceled" ]; then
            log.error "job canceled"
            exit
        fi
        if [ $status == "success" ]; then
            break
        fi
        sleep 1
    done
    echo
fi

if [ "$command" == 'download' ] || [ "$command" == 'all' ]; then
    jobid="${jobid:-$2}"

    [[ -z $jobid ]] && log.error "no jobid given" && exit

    artifacts_id=$(curl --silent "$GITLAB_URL/api/v4/projects/$project_id/pipelines/$jobid/jobs?scope=success" \
        --header "PRIVATE-TOKEN: $GITLAB_ACCESS_TOKEN" | jq '.[] | .id')

    log.log "starting download $artifacts_id"

    response=$(curl "$GITLAB_URL/api/v4/projects/$project_id/jobs/$artifacts_id/artifacts" \
        --progress-bar \
        -w "%{http_code}\n" \
        -D "$outHeadersFile" \
        -o "$outZipFile.tmp" \
        --header "PRIVATE-TOKEN: $GITLAB_ACCESS_TOKEN" \
        "${etagArgs[@]}")

    if [[ "$response" == 4* ]] || [[ "$response" == 5* ]]; then
        echo "ERROR - Http status: $response"
        rm "$outZipFile.tmp"
        exit 1
    elif [[ "$response" == 304 ]]; then
        echo "$project is up-to-date"
    else
        echo "update $outZipFile"
        mv "$outZipFile.tmp" "$outZipFile"
    fi
fi

if [ "$command" == 'extract' ] || [ "$command" == 'all' ]; then
    log.log "extract dump"
    rm -rf dump/*
    unzip $outZipFile
    $(
        cd dump
        tar xzf fileadmin.tar.gz
    )
fi

if [ "$command" == 'rsync' ] || [ "$command" == 'all' ]; then
    log.log "rsync fileadmin"
    params='--delete --recursive --links --perms --times --group --owner --devices --verbose --itemize-changes'
    folder="public/fileadmin"
    ${RSYNC} ${params} ${file_exclude} dump/$folder/ $folder/
fi

if [ "$command" == 'import' ] || [ "$command" == 'all' ]; then
    log.log "import database"
    gunzip -c dump/db.sql.gz | $BIN_T3CONSOLE database:import
fi

if [ "$command" == 'clear' ] || [ "$command" == 'all' ]; then
    log.log "clear cache"
    ${TYPO3_CLEARALLCACHECMD}
fi
exit

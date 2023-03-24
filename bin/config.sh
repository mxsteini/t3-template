# short project key - lowercase
PREPARE[projectname]="t3-template"
PREPARE[author]="Michael Stein"

# Vendor
PREPARE[LOWERVENDOR]="mst"

PREPARE[CAPITALVENDOR]=${PREPARE[LOWERVENDOR]^}
PREPARE[UPPERVENDOR]=${PREPARE[LOWERVENDOR]^^}

# baseurl for TYPO3, mostly live-url
PREPARE[url]=""

PREPARE[sitename]="t3 template"
PREPARE[ddev_phpversion]="8.1"

### gitlab-ci-setting

### gitlab setup
PREPARE[gitlaburl]=""
# setting/ci_cd -> Pipeline triggers
PREPARE[pipelinetoken]=""
# setting/access_tokens
PREPARE[accesstoken]=""
# project ID
PREPARE[projectid]=""


### server information
# place php-binary on the server
PREPARE[php]=""

# place php-binary on the server
PREPARE[livephp]=${PREPARE[php]}

# basepath without production
PREPARE[livepath]=""
PREPARE[livehost]=""

# the loginuser for the gitlab-runner
PREPARE[liveloginuser]=""

# the owner of the deployed files e.g. www, www-data
PREPARE[liveuser]=""
# the group of the deployed files e.g. www, www-data
PREPARE[livegroup]=""

PREPARE[stagephp]=${PREPARE[livephp]}
PREPARE[stagepath]=${PREPARE[livepath]}
PREPARE[stagehost]=${PREPARE[livehost]}
PREPARE[stageloginuser]=${PREPARE[liveloginuser]}
PREPARE[stageuser]=${PREPARE[liveuser]}
PREPARE[stagegroup]=${PREPARE[livegroup]}


# TYPO3 Fast Develope Template

# Introduction

This template closes the gap between between frontend and backend development.

A browsersync-server gives you instant result of your developmen

It contains a fast scss, js compiler based on dart-sass and esbuild

The hole system is .env driven. So there is no need to put any secret information in your repository.

## Information
The base version doesn't track LocalConfiguration.php (or setup.php). This file contains critical information an could be change by the
extension manager on the live system.

## Prerequisites

* ddev
* local node 14 or more

### fix broken mac apps

```bash
brew install jq
brew install coreutils findutils gnu-tar gnu-sed gawk gnutls gnu-indent gnu-getopt grep
brew install unzip
brew install gzip
```


# Setup

## base setup
```bash
cp ./bin/config.sh.dist ./bin/config.sh
```

Have a look at .env


Edit ./bin/config.sh according your needs (leave unknown values empty - they could be added later)

## prepare
this should create a setup for a working project
```bash
./bin/prepare.sh
```

```bash
ddev start
ddev composer install
```

### downsync database and fileadmin
GITLAB_ACCESS_TOKEN is needed in .env!
```bash
bin/down_sync.sh
```

## DDEV setup

```bash
ddev exec bin/down_sync.sh
```
# Credits
## Frank Deutschmann
You encouraged me to work on this project

## monobloc
A famous company with smart peaple that uses this stuff. Visit their website:

https://www.monobloc.de/

## jweiland
The html-template and parts of the typoscript and site-package are based on this template:

https://jweiland.net/typo3/typo3-template-version-11.html

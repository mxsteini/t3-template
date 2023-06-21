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
* local node 16 or more
* bash version 5
* gnu-sed available as sed
* mkcert


# Mac user

Your underlying unix-system is mostly poorly old. You could fix that by installing up-to-date software

Please ensure, that your installed software is available for the prepare-script.

```bash
brew install jq
brew install coreutils findutils gnu-tar gnu-sed gawk gnutls gnu-indent gnu-getopt grep
brew install unzip
brew install gzip
brew install mkcert
```

# Setup

## The easiest way to checkout the full magic without deep diving

### Install
```bash
git clone https://github.com/mxsteini/t3-template.git
cd test
./test.sh
```
### Next
- Than open test/temp/src/mst_site/html/Page/Templates/Default.html
- change the color in scss-section
- save!

### Next
- login into the backend prepare/prepare
- change the name of a page in the main navigation


## Diving deeper

### create the system

```bash
ddev start
ddev composer install
ddev typo3cms install:fixfolderstructure
npm i
ddev launch
npm start
```

## login
user: prepare
pass: prepare

### creating some certificates for smoother workflow
```bash
mkdir -p ./var/certs
. ./.env && mkcert $T3BUILD_BRWOSERSYNC_TYPO3_HOST && mv ./*.pem var/certs
. ./.env && mkcert $T3BUILD_BRWOSERSYNC_STANDALONE_HOST && mv ./*.pem var/certs
```

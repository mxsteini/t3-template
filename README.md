# TYPO3 CMS Base Distribution

Get going quickly with TYPO3 CMS.

## Prerequisites

* PHP 8.1
* node v16.x
* GraphicsMagick
* [Composer 2](https://getcomposer.org/download/)

### fix broken mac apps

```bash
brew install jq
brew install coreutils findutils gnu-tar gnu-sed gawk gnutls gnu-indent gnu-getopt grep
brew install unzip
brew install gzip
```

## Quickstart
## Prerequisites
* a running webserver
* a running db
* alternative use ddev-setup

### Setup
```bash
cp -i .env.dist .env
cp -i .ddev/config.yaml.dist .ddev/config.yaml
cp -i public/typo3conf/LocalConfiguration.php.dist public/typo3conf/LocalConfiguration.php
ddev start
ddev composer install
npm i
npm run build
ddev typo3cms database:import < db/db.sql
```

login as monobloc/monobloc




```bash

vendor/bin/typo3cms install:fixfolderstructure
vendor/bin/typo3cms database:updateschema

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

```bash
cp -i .env.ddev .env
cp -i .ddev/config.yaml.dist .ddev/config.yaml
ddev composer install
ddev typo3cms database:import < db/db.sql
npm i

```
adjust .env
adjust .ddev/config.yaml

```bash
ddev start
cp -i public/typo3conf/LocalConfiguration.php.dist public/typo3conf/LocalConfiguration.php
bin/build.sh all
bin/down_sync.sh
```

# Deployment (git workflow)
Every deployment is realised by feature branches.

Normally branch production is used as base.

Every feature must be buildable on the gitlab build-server.

```bash
git checkout production
git checkout -b feature/new-feature
# development
git push
```

## Deploy on stage
```bash
git checkout stage
git merge  feature/new-feature
git push
```

## Deploy on production
```bash
git checkout production
git merge feature/new-feature
git push
```

# Development

## Backend
have a look at packages

## Frontend
The frontend sources are located in src

src/html: sources to build fluid template, partials and layouts
src/design: sources for css and js

### init
```bash
npm i
```

### build assets and fluid-stuff
```bash
bin/build.sh assets
bin/build.sh html
```

### Development with simple watch
#### For small changes, use
```bash
npm run watch
```

#### Heavy development with browsersync
For heavy frontend development, you can use.
This includes watch from above and a browsersynced proxy from your local typo3 installation.
```bash
npm run serve
```

# vdiff
```bash
cd fetest
npm i
npx vdiff --target1 ddev --target2 live --sequence sitemap
```

test

# Xd Link / Design
https://xd.adobe.com/view/812fb0dd-0ec1-4909-90ef-49f9670baf76-d47c/

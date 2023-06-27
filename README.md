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
#### Requirement:
- ddev
- mkcert

```bash
git clone https://github.com/mxsteini/t3-template.git
cd test
./ddev-test.sh
```

visit typo3 frontend: https://t3template.ddev.site

login typo3 backen (prepare/prepare): https://t3template.ddev.site/typo3

watch any changes (file or backend changes) in browsersync: https://t3template.ddev.site:4000


### change a template file
- Than open test/temp/src/mst_site/html/Page/Templates/Default.html
- change a color in scss-section
- save!

### rename a page in the main navigation
- login into the backend prepare/prepare
- change the name of a page in the main navigation


# Diving deeper

A normal project start begins with the base system being initialized.

In the local development we assume that ddev is used.

In addition, some settings are made in for gitlab-ci but are currently still in alpha stage and not further documented.

## Configuration

At the beginning of a project, a configuration is stored in the file ./bin/config.sh.dist, which all colleagues can use to initialize their local environment.

Branding and setup
Then ./bin/config.sh.dist is copied to ./bin/config.sh and ./bin/prepare.sh is started.
This script configures the site-package according to the desired vendor and package settings.
It initializes the ddev configuration and the .gitlab-ci.yaml. The latter is the currently not further documented.

After ./bin/prepare.sh has run successfully, the TYPO3 system can be initialized.

```bash
ddev start

# npm
ddev npm i t3-build
ddev npm i alpinejs
ddev npm i @alpinejs/collapse
ddev npm run build

# composer
ddev composer install

# default databse
ddev import-db --src=db/prepare.sql.gz

# import systemplate and fix folderstructure
ddev exec vendor/bin/typo3 database:import <db/sys_template.sql
ddev exec vendor/bin/typo3 install:fixfolderstructure
```
Now your TYPO3 should be running and accessible under the desired URL.

To speed up the frontend development t3-build uses browsersync. This is accessible under the port specified in .env.


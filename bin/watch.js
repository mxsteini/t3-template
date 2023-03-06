import * as dotenv from 'dotenv' // see https://github.com/motdotla/dotenv#how-do-i-use-dotenv-with-import
import * as path from 'path'
import * as Glob from 'glob'
import * as Fse from 'fs-extra'
import * as fs from 'fs'
import * as child from 'child_process'
import Bs from 'browser-sync'
import * as Watch from 'node-watch'
import BuildFunc from '../lib/buildFunc.js'

const buildFuncs = new BuildFunc()
const fse = Fse.default
const glob = Glob.default
const exec = child.exec
const projectPath = process.env.INIT_CWD
const watch = Watch.default

const rawdata = fs.readFileSync(path.join(projectPath, 'package.json'))
let config = JSON.parse(rawdata)


dotenv.config({
    path: path.join(projectPath, '.env')
})


let htmlRoot = 'src/html'
const clearCacheCmd = process.env.TYPO3_CLEARCACHECMD || 'vendor/bin/typo3cms cache:flush --group=pages'
const clearAllCacheCmd = process.env.TYPO3_CLEARALLCACHECMD || 'vendor/bin/typo3cms cache:flush'
const htmlPath = path.join(path.resolve('src/html'), '/**/*.html')


fse.copySync(
    path.resolve('./src/assets'),
    path.resolve('packages/mono_site/Resources/Public/')
)

console.log('processing html')
let files = glob.sync(htmlPath)
files.forEach((file) => {
    buildFuncs.postHtmlProcessor(file, config)
})

console.log('processing js')
exec('npm run browserify:development', (err, stdout, stderr) => {
    if (err) {
        console.error(`exec error: ${err}`)
        return
    }
    bs.reload()
})

console.log('processing sass')
buildFuncs.sassProcessor(config.posthtml.plugins['posthtml-scss-to-file'])

console.log('start browsersync')
const bs = new Bs.init({
    open: true,
    port: process.env.BRWOSERSYNC_PORT || '8090',
    proxy: process.env.BRWOSERSYNC_PROXY || 'https://samaya.localhost/',
    host: process.env.BRWOSERSYNC_HOST || 'https://watch.localhost/',
    https: true,
    notify: false,
    files: [
        {
            match: [
                path.resolve('public/typo3temp/ReloadFrontend.now')
            ],
            fn: function (event, file) {
                console.log('clearCache by Backend')
                bs.reload()
            }
        },
        {
            match: [
                path.resolve('packages/*/Configuration/TypoScript/**/*.typoscript'),
                path.resolve('packages/*/Classes/**/*.php')
            ],
            fn: function (event, file) {
                console.log('clearCache')
                exec(clearCacheCmd, function () {
                    bs.reload()
                })
            }
        },
        {
            match: [
                path.resolve('packages/mono_site/Configuration/**/*.yaml'),
                path.resolve('packages/mono_site/Configuration/**/*.php'),
                path.resolve('packages/mono_site/Resources/Private/Language/**/*.xlf')
            ],
            fn: function (event, file) {
                console.log('clearAllCache')
                exec(clearAllCacheCmd, function () {
                    bs.reload()
                })
            }
        }
    ]
})

console.log('start sass-watcher')
watch('src/scss', {recursive: true}, function (evt, target) {
    console.log('sass triggered')
    buildFuncs.sassProcessor(config.posthtml.plugins['posthtml-scss-to-file'],bs.reload())
})


console.log('start html-watcher')
watch(htmlRoot, {recursive: true}, function (event, target) {
    const file = path.resolve(target)
    let targetFile = target.substring(target.length, htmlRoot.length)

    switch (event) {
        case 'update':
            buildFuncs.postHtmlProcessor(file, config, bs.reload())
            break
        case 'remove':
            fse.removeSync(
                path.resolve(
                    path.join(
                        config.t3template.site_package,
                        'Resources/Private',
                        targetFile
                    )
                )
            )
            break
    }
})

console.log('start html-modules-watcher')
watch('src/html-modules', {recursive: true}, function (event, target) {
    console.log('html-modules triggered')
    files.forEach((file) => {
        buildFuncs.postHtmlProcessor(file, config)
    })
    bs.reload()
})

console.log('start asset-watcher')
watch('src/assets', {recursive: true}, function (event, target) {
    console.log('asset triggered')
    let file = target.substring(target.length, 'src/assets'.length)

    switch (event) {
        case 'update':
            fse.copySync(
                path.resolve(target),
                path.join(path.resolve('packages/mono_site/Resources/Public/'), file)
            )
            break
        case 'remove':
            fse.removeSync(path.join(path.resolve('packages/mono_site/Resources/Public/'), file))
            break
    }
})


console.log('start js-watcher')
watch('./src/js', { recursive: true }, function (evt, name) {
    exec('npm run browserify:development', (err, stdout, stderr) => {
        if (err) {
            console.error(`exec error: ${err}`)
            return
        }
        bs.reload()
    })
})


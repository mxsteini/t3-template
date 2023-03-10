import * as path from 'path'
import * as Glob from 'glob'
import * as Fse from 'fs-extra'
import * as fs from 'fs'
import * as child from 'child_process'
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


const clearCacheCmd = process.env.TYPO3_CLEARCACHECMD || 'vendor/bin/typo3cms cache:flush --group=pages'
const clearAllCacheCmd = process.env.TYPO3_CLEARALLCACHECMD || 'vendor/bin/typo3cms cache:flush'


console.log('start browsersync')

buildFuncs.createBrowsersync()

console.log('start sass-watcher for:')
buildFuncs.packages.forEach(packageName => {
    console.log('… ' + packageName)
    const targetPath = path.join(path.resolve('src'), packageName, 'scss')
    watch(targetPath, {recursive: true}, function (event, target) {
        const targetPath = path.join(path.resolve('src'), packageName, 'scss/**/*.scss')
        glob.sync(targetPath).forEach(file => {
            if (!path.basename(file).startsWith('_')) {
                const relativeFile = path.relative(
                    path.join(path.resolve('src'), packageName, 'scss'),
                    file
                )
                buildFuncs.sassProcessor(relativeFile, packageName, buildFuncs.bs.reload())
            }
        })
    })
})

console.log('start js-watcher for:')
buildFuncs.packages.forEach(packageName => {
    console.log('… ' + packageName)
    const targetPath = path.join(path.resolve('src'), packageName, 'js')
    watch(targetPath, {recursive: true}, function (event, target) {
        const targetPath = path.join(path.resolve('src'), packageName, 'js/*.js')
        glob.sync(targetPath).forEach(file => {
            const relativeFile = path.relative(
                path.join(path.resolve('src'), packageName, 'js'),
                file
            )
            buildFuncs.jsProcessor(relativeFile, packageName, buildFuncs.bs.reload())
        })
    })
})

console.log('start html-watcher for:')
buildFuncs.packages.forEach(packageName => {
    console.log('… ' + packageName)
    const targetPath = path.join(path.resolve('src'), packageName, 'html')
    watch(targetPath, {recursive: true}, function (event, target) {
        const file = path.resolve(target)
        console.log(file)
        const relativeFile = path.relative(
            path.join(path.resolve('src'), packageName, 'html'),
            file
        )
        // let targetFile = target.substring(target.length, htmlRoot.length)

        switch (event) {
            case 'update':
                buildFuncs.postHtmlProcessor(relativeFile, packageName, true)
                break
            case 'remove':
                // fse.removeSync(
                //     path.resolve(
                //         path.join(
                //             config.t3template.site_package,
                //             'Resources/Private',
                //             targetFile
                //         )
                //     )
                // )
                break
        }
    })
})


//
// console.log('start html-watcher')
// watch(htmlRoot, {recursive: true}, function (event, target) {
//     const file = path.resolve(target)
//     let targetFile = target.substring(target.length, htmlRoot.length)
//
//     switch (event) {
//         case 'update':
//             buildFuncs.postHtmlProcessor(file, config, bs.reload())
//             break
//         case 'remove':
//             fse.removeSync(
//                 path.resolve(
//                     path.join(
//                         config.t3template.site_package,
//                         'Resources/Private',
//                         targetFile
//                     )
//                 )
//             )
//             break
//     }
// })
//
// console.log('start html-modules-watcher')
// watch('src/html-modules', {recursive: true}, function (event, target) {
//     console.log('html-modules triggered')
//     files.forEach((file) => {
//         buildFuncs.postHtmlProcessor(file, config)
//     })
//     bs.reload()
// })
//
// console.log('start asset-watcher')
// watch('src/assets', {recursive: true}, function (event, target) {
//     console.log('asset triggered')
//     let file = target.substring(target.length, 'src/assets'.length)
//
//     switch (event) {
//         case 'update':
//             fse.copySync(
//                 path.resolve(target),
//                 path.join(path.resolve('packages/mono_site/Resources/Public/'), file)
//             )
//             break
//         case 'remove':
//             fse.removeSync(path.join(path.resolve('packages/mono_site/Resources/Public/'), file))
//             break
//     }
// })
//
//
// console.log('start js-watcher')
// watch('./src/js', { recursive: true }, function (evt, name) {
//     exec('npm run browserify:development', (err, stdout, stderr) => {
//         if (err) {
//             console.error(`exec error: ${err}`)
//             return
//         }
//         bs.reload()
//     })
// })
//

import * as dotenv from 'dotenv' // see https://github.com/motdotla/dotenv#how-do-i-use-dotenv-with-import
import * as path from 'path'
import * as Glob from 'glob'

import BuildFunc from '../lib/buildFunc.js'

const buildFuncs = new BuildFunc(true)
const glob = Glob.default

console.log('processing html')
buildFuncs.packages.forEach(packageName => {
    const targetPath = path.join(path.resolve('src'), packageName, 'html/**/*.html')
    glob.sync(targetPath).forEach(file => {
        const relativeFile = path.relative(
            path.join(path.resolve('src'), packageName, 'html'),
            file
        )
        buildFuncs.postHtmlProcessor(relativeFile, packageName)
    })
})

console.log('processing js')
buildFuncs.packages.forEach(packageName => {
    const targetPath = path.join(path.resolve('src'), packageName, 'js/*.js')
    glob.sync(targetPath).forEach(file => {
        const relativeFile = path.relative(
            path.join(path.resolve('src'), packageName, 'js'),
            file
        )
        buildFuncs.jsProcessor(relativeFile, packageName)
    })
})


console.log('processing scss')
buildFuncs.packages.forEach(packageName => {
    const targetPath = path.join(path.resolve('src'), packageName, 'scss/**/*.scss')
    glob.sync(targetPath).forEach(file => {
        if (!path.basename(file).startsWith('_')) {
            const relativeFile = path.relative(
                path.join(path.resolve('src'), packageName, 'scss'),
                file
            )
            buildFuncs.sassProcessor(relativeFile, packageName)
        }
    })
})


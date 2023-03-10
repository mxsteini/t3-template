import * as dotenv from 'dotenv' // see https://github.com/motdotla/dotenv#how-do-i-use-dotenv-with-import
import * as path from 'path'
import * as Glob from 'glob'
import * as Fse from 'fs-extra'
import * as fs from 'fs'
import * as child from 'child_process'

import BuildFunc from '../lib/buildFunc.js'

const buildFuncs = new BuildFunc()
const fse = Fse.default
const glob = Glob.default
const exec = child.exec
const projectPath = process.env.INIT_CWD

const rawdata = fs.readFileSync(path.join(projectPath, 'package.json'))
let config = JSON.parse(rawdata)


dotenv.config({
    path: path.join(projectPath, '.env')
})

console.log('processing js')
buildFuncs.jsProcessor()

console.log('processing html')
buildFuncs.packages.forEach(target => {
    const targetPath = path.join(path.resolve('src'), target, 'html/**/*.html')
    glob.sync(targetPath).forEach(file => {
        buildFuncs.postHtmlProcessor(file)
    })
})

console.log('processing scss')
buildFuncs.packages.forEach(target => {
    const targetPath = path.join(path.resolve('src'), target, 'scss/**/*.scss')
    glob.sync(targetPath).forEach(file => {
        if (!path.basename(file).startsWith('_')) {
            const relativeFile = path.relative(
                path.join(path.resolve('src'), target, 'scss'),
                file
            )
            buildFuncs.sassProcessor(relativeFile, target)
        }
    })
})

process.exit()

let htmlRoot = 'src/html'
const htmlPath = path.join(path.resolve('src/html'), '/**/*.html')

let files = glob.sync(htmlPath)

fse.copySync(
    path.resolve('./src/assets'),
    path.resolve('packages/mono_site/Resources/Public/')
)


console.log('processing html')
files.forEach((file) => {
    buildFuncs.postHtmlProcessor(file, config)
})

console.log('processing js')
buildFuncs.writeContentToFile('', path.join('packages/mono_site/Resources/Public/JavaScript', 'Main.js'))

exec('npm run browserify:build', (err, stdout, stderr) => {
    if (err) {
        console.error(`exec error: ${err}`)
        return
    }
})

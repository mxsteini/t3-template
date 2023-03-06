import * as dotenv from 'dotenv' // see https://github.com/motdotla/dotenv#how-do-i-use-dotenv-with-import
import * as path from 'path'
import * as Glob from 'glob'
import * as Fse from 'fs-extra'
import * as fs from 'fs'
import * as Posthtml from 'posthtml'
import * as PosthtmlScssToFile from 'posthtml-scss-to-file'
import * as Sass from 'sass'
import * as child from 'child_process'
import Bs from 'browser-sync'
import * as Watch from 'node-watch'
import * as Stream from 'stream'
import * as PosthtmlInclude from 'posthtml-include'

import BuildFunc from '../lib/buildFunc.js'

const buildFuncs = new BuildFunc()
const fse = Fse.default
const glob = Glob.default
const posthtml = Posthtml.default
const posthtmlScssToFile = PosthtmlScssToFile.default
const posthtmlInclude = PosthtmlInclude.default
const sass = Sass.default
const exec = child.exec
const projectPath = process.env.INIT_CWD
const watch = Watch.default
const stream = Stream.Stream

const rawdata = fs.readFileSync(path.join(projectPath, 'package.json'))
let config = JSON.parse(rawdata)


dotenv.config({
    path: path.join(projectPath, '.env')
})


let htmlRoot = 'src/html'
const htmlPath = path.join(path.resolve('src/html'), '/**/*.html')

let files = glob.sync(htmlPath)

fse.copySync(
    path.resolve('./src/assets'),
    path.resolve('packages/mono_site/Resources/Public/')
)

console.log('processing sass')
buildFuncs.sassProcessor(config.posthtml.plugins['posthtml-scss-to-file'])

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

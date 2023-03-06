import * as Sass from 'sass'
import path from 'path'
import fs from 'fs'
import * as child from 'child_process'
import * as esbuild from 'esbuild'
import * as Fse from 'fs-extra'
import {pathToFileURL} from 'url'

const fse = Fse.default


const exec = child.exec
import * as dotenv from 'dotenv' // see https://github.com/motdotla/dotenv#how-do-i-use-dotenv-with-import


export default class BuildFunc {

    constructor() {
        this.sass = Sass.default
        this.projectPath = process.env.INIT_CWD
        this.packages = fs.readdirSync(path.resolve('src'))
        this.packages.forEach(target => {
            this.cleanupPackage(target)
            this.copyAssets(target)
        })

        dotenv.config({
            path: path.join(this.projectPath, '.env')
        })
        this.clearCacheCmd = process.env.TYPO3_CLEARCACHECMD || 'vendor/bin/typo3cms cache:flush --group=pages'
    }

    cleanupPackage(target) {
        fs.rmSync(path.resolve(path.join('packages', target, 'Resources')), {recursive: true, force: true})
    }

    copyAssets(target) {
        if (fs.existsSync(path.resolve(path.join('src', target, 'assets/Public')))) {
            fse.copySync(
                path.resolve(path.join('src', target, 'assets/Public')),
                path.resolve(path.join('packages', target, 'Resources/Public'))
            )
        }

        if (fs.existsSync(path.resolve(path.join('src', target, 'assets/Private')))) {
            fse.copySync(
                path.resolve(path.join('src', target, 'assets/Private')),
                path.resolve(path.join('packages', target, 'Resources/Private'))
            )
        }
        fs.mkdirSync(path.resolve(path.join('packages', target, 'Resources/Public/JavaScripts')), {
            recursive: true,
        })
        fs.mkdirSync(path.resolve(path.join('packages', target, 'Resources/Public/StyleSheets')), {
            recursive: true,
        })
    }


    jsProcessor(callback) {
        this.packages.forEach(target => {
            let files = fs.readdirSync(path.resolve(path.join('src', target, 'js')))
            files.forEach(async file => {
                if (path.extname(file) === '.js') {
                    await esbuild
                        .build({
                            entryPoints: [path.resolve(path.join('src', target, 'js', file))],
                            bundle: true,
                            sourcemap: true,
                            platform: 'browser',
                            external: ['require', 'fs', 'path'],
                            format: 'iife',
                            outdir: path.resolve(path.join('packages', target, 'Resources/Public/JavaScripts')),
                        })
                        .catch((e) => console.log(e))
                        .then(() => {
                            if (callback) {
                                callback()
                            }
                        })
                }
            })
        })
        return false
    }

    sassProcessor(callback) {
        this.packages.forEach(target => {
            let files = fs.readdirSync(path.resolve(path.join('src', target, 'scss')))
            files.forEach(file => {
                if (path.extname(file) === '.scss' && !file.startsWith('_')) {
                    const sourceFile = path.resolve(path.join('src', target, 'scss', file))
                    const destFile = path.resolve(path.join('packages', target, 'Resources/Public/StyleSheets', file.replace('scss', 'css')))

                    const config = {
                        sourceMap: true,
                        importers: [{
                            findFileUrl(url) {
                                if (url.startsWith('./')) return null
                                if (url.startsWith('../')) return null
                                return (pathToFileURL(path.join(path.resolve('./node_modules'), url)))
                            }
                        }]
                    }

                    const result = this.sass.compile(sourceFile, config)
                    this.writeContentToFile(result.css, destFile)
                    console.log(result.sourceMap)
                    this.writeContentToFile(result.sourceMap, destFile + '.map')
                }
            })
        })
        if (callback) {
            callback()
        }
    }

    writeContentToFile(data, file) {
        if (!fs.existsSync(path.dirname(file))) {
            fs.mkdirSync(path.dirname(file), {
                recursive: true,
            })
        }
        fs.writeFileSync(path.resolve(file), data, 'utf-8', function (error) {
            if (error) throw error
        })
    }
}

import * as Sass from 'sass'
import path from 'path'
import fs from 'fs'
import * as child from 'child_process'
import * as esbuild from 'esbuild'

import {pathToFileURL} from 'url'


const exec = child.exec
import * as dotenv from 'dotenv' // see https://github.com/motdotla/dotenv#how-do-i-use-dotenv-with-import


export default class BuildFunc {

    constructor() {
        this.sass = Sass.default
        this.projectPath = process.env.INIT_CWD

        dotenv.config({
            path: path.join(this.projectPath, '.env')
        })
        this.clearCacheCmd = process.env.TYPO3_CLEARCACHECMD || 'vendor/bin/typo3cms cache:flush --group=pages'
    }

    jsProcessor(config, callback) {
        config.files.forEach(async target => {
            let file = path.resolve(path.join(config.source, target + '.js'))

            if (fs.existsSync(file)) {
                await esbuild
                    .build({
                        entryPoints: [file],
                        bundle: true,
                        sourcemap: true,
                        platform: 'browser',
                        external: ['require', 'fs', 'path'],
                        format: 'iife',
                        outdir: path.resolve(config.dest),
                    })
                    .catch((e) => console.log(e))
                    .then(() => {
                        if (callback) {
                            callback()
                        }
                    })
            }
        })
        return false
    }

    sassProcessor(config, callback) {
        try {
            config.files.forEach(target => {
                let file = path.resolve(path.join(config.source, target + '.scss'))
                if (fs.existsSync(file)) {
                    config.config.file = file

                    const destFile = path.join(path.resolve(config.dest), target + '.css')
                    if (config.config.sourceMap) {
                        config.config.outFile = destFile
                    }
                    config.config.importers = [{
                        findFileUrl(url) {
                            if (url.startsWith('./')) return null
                            if (url.startsWith('../')) return null
                            return (pathToFileURL(path.join(path.resolve('./node_modules'), url)))
                        }
                    }]

                    const result = this.sass.compile(config.config.file, config.config)

                    this.writeContentToFile(result.css, destFile)

                    if (callback) {
                        callback()
                    }
                }
            })
        } catch (e) {
            console.log(e)
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

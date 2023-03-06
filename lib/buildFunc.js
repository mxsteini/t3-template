import * as Sass from 'sass'
import path from 'path'
import fs from 'fs'
import * as Posthtml from 'posthtml'
import * as PosthtmlScssToFile from 'posthtml-scss-to-file'
import * as PosthtmlInclude from 'posthtml-include'
import * as child from 'child_process'
const exec = child.exec
import * as dotenv from 'dotenv' // see https://github.com/motdotla/dotenv#how-do-i-use-dotenv-with-import


export default class BuildFunc {

    constructor(Alpine) {
        this.sass = Sass.default
        this.posthtml = Posthtml.default
        this.posthtmlScssToFile = PosthtmlScssToFile.default
        this.posthtmlInclude = PosthtmlInclude.default
        this.projectPath = process.env.INIT_CWD

        dotenv.config({
            path: path.join(this.projectPath, '.env')
        })
        this.clearCacheCmd = process.env.TYPO3_CLEARCACHECMD || 'vendor/bin/typo3cms cache:flush --group=pages'
    }

    sassProcessor(options, callback) {
        try {
            // let options = JSON.parse(JSON.stringify(config.posthtml.plugins['posthtml-scss-to-file']))

            options.sass.sourceMapIncludeSources = true
            const files = ['style', 'rte', 'backend']
            files.forEach(target => {
                let file = path.resolve(path.join('src/scss/', target + '.scss'))
                if (fs.existsSync(file)) {
                    options.sass.file = file

                    const destFile = path.join(path.resolve(options.dest), target + '.css')
                    if (options.sass.sourceMap) {
                        options.sass.outFile = destFile
                    }
                    const result = this.sass.compile(options.sass.file, options.sass)

                    this.writeContentToFile(result.css, destFile)

                    if (callback) {
                        callback
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

    postHtmlProcessor(file, config, callback) {
        const quiet = true
        try {
            const html = fs.readFileSync(file).toString('utf-8')

            let localOptions = JSON.parse(JSON.stringify(config.posthtml.plugins['posthtml-scss-to-file']))

            const result = this.posthtml()
                .use(this.posthtmlScssToFile(localOptions, this.sass))
                .use(this.posthtmlInclude({root: './src/html-modules/'}))
                .process(html, {
                    xmlMode: true,
                    sync: true,
                    from: file
                }).html

            const destPath = path.resolve(
                path.join(
                    config.t3template.site_package,
                    'Resources/Private'
                )
            )

            let relativeFile = file.substring(
                file.length,
                path.resolve(localOptions.src).length
            )
            const originFile = path.join(destPath, relativeFile)
            let origin
            if (fs.existsSync(originFile)) {
                origin = fs.readFileSync(originFile).toString('utf-8')
            }

            if (origin !== result) {
                if (!quiet) {
                    console.log('html changed')
                }
                this.writeContentToFile(result, path.join(destPath, relativeFile))
                exec(this.clearCacheCmd, function () {
                    if (callback) {
                        callback
                    }
                })
            } else {
                if (!quiet) {
                    console.log('css changed')
                }
                if (callback) {
                    callback
                }
            }
        } catch (e) {
            console.log(e)
        }
    }


}

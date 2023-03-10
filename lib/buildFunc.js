import * as Sass from 'sass'
import path from 'path'
import fs from 'fs'
import * as child from 'child_process'
import * as esbuild from 'esbuild'
import * as Fse from 'fs-extra'
import * as Posthtml from 'posthtml'
import * as PosthtmlScssToFile from 'posthtml-scss-to-file'
import * as PosthtmlInclude from 'posthtml-include'
import * as dotenv from 'dotenv'
import {pathToFileURL} from 'url'
import Bs from 'browser-sync'

const fse = Fse.default


const exec = child.exec

dotenv.config({
    path: path.resolve('.env')
})

const clearCacheCmd = process.env.TYPO3_CLEARCACHECMD || 'vendor/bin/typo3cms cache:flush --group=pages'
const clearAllCacheCmd = process.env.TYPO3_CLEARALLCACHECMD || 'vendor/bin/typo3cms cache:flush'

export default class BuildFunc {

    sassConfig = {
        sourceMap: true, importers: [{
            findFileUrl(url) {
                if (url.startsWith('scss')) {
                    return (pathToFileURL(path.join(path.resolve('./src'), packageName, url)))
                }
                if (url.startsWith('./')) return null
                if (url.startsWith('../')) return null
                return (pathToFileURL(path.join(path.resolve('./node_modules'), url)))
            }
        }]
    }

    constructor(clean = false) {
        this.sass = Sass.default
        this.projectPath = process.env.INIT_CWD
        this.posthtml = Posthtml.default
        this.posthtmlScssToFile = PosthtmlScssToFile.default
        this.posthtmlInclude = PosthtmlInclude.default
        this.packages = fs.readdirSync(path.resolve('src'))
        if (clean) {
            this.packages.forEach(target => {
                this.cleanupPackage(target)
                this.copyAssets(target)
            })
        }

        dotenv.config({
            path: path.join(this.projectPath, '.env')
        })
        this.clearCacheCmd = process.env.TYPO3_CLEARCACHECMD || 'vendor/bin/typo3cms cache:flush --group=pages'
    }

    createBrowsersync() {
        this.bs = new Bs.init({
            open: true,
            port: process.env.BRWOSERSYNC_PORT,
            proxy: process.env.BRWOSERSYNC_PROXY,
            host: process.env.BRWOSERSYNC_HOST,
            https: true,
            notify: false,
            files: [
                {
                    match: [
                        path.resolve('public/typo3temp/ReloadFrontend.now')
                    ],
                    fn: (event, file) => {
                        console.log('clearCache by Backend')
                        this.bs.reload()
                    }
                },
                {
                    match: [
                        path.resolve('packages/*/Configuration/TypoScript/**/*.typoscript'),
                        path.resolve('packages/*/Classes/**/*.php')
                    ],
                    fn: (event, file) => {
                        console.log('clearCache')
                        exec(clearCacheCmd, () => {
                            this.bs.reload()
                        })
                    }
                },
                {
                    match: [
                        path.resolve('packages/*/Configuration/**/*.yaml'),
                        path.resolve('packages/*/Configuration/**/*.php'),
                        path.resolve('packages/*/Resources/Private/Language/**/*.xlf')
                    ],
                    fn: (event, file) => {
                        console.log('clearAllCache')
                        exec(clearAllCacheCmd, () => {
                            this.bs.reload()
                        })
                    }
                }
            ]
        })
    }

    cleanupPackage(target) {
        fs.rmSync(path.resolve(path.join('packages', target, 'Resources')), {recursive: true, force: true})
    }

    copyAssets(target) {
        if (fs.existsSync(path.resolve(path.join('src', target, 'assets/Public')))) {
            fse.copySync(path.resolve(path.join('src', target, 'assets/Public')), path.resolve(path.join('packages', target, 'Resources/Public')))
        }

        if (fs.existsSync(path.resolve(path.join('src', target, 'assets/Private')))) {
            fse.copySync(path.resolve(path.join('src', target, 'assets/Private')), path.resolve(path.join('packages', target, 'Resources/Private')))
        }
        fs.mkdirSync(path.resolve(path.join('packages', target, 'Resources/Public/JavaScript')), {
            recursive: true,
        })
        fs.mkdirSync(path.resolve(path.join('packages', target, 'Resources/Public/Css')), {
            recursive: true,
        })
    }

    jsProcessor(file, target, reload = false) {
        console.log(file)
        const sourceFile = path.resolve(path.join('src', target, 'js', file))
        esbuild.build({
            entryPoints: [sourceFile],
            bundle: true,
            sourcemap: true,
            platform: 'browser',
            external: ['require', 'fs', 'path'],
            format: 'iife',
            outdir: path.resolve(path.join('packages', target, 'Resources/Public/JavaScript')),
        })
            .catch((e) => console.log(e))
            .then(() => {
                if (reload) {
                    exec(clearCacheCmd, () => {
                        this.bs.reload()
                    })
                }
            })
    }

    sassProcessor(file, target, reload = undefined) {
        const sourceFile = path.resolve(path.join('src', target, 'scss', file))
        const destFile = path.resolve(path.join('packages', target, 'Resources/Public/Css', file.replace('scss', 'css')))
        const result = this.sass.compile(sourceFile, this.sassConfig)
        this.writeContentToFile(result.css, destFile)
        if (reload) {
            this.bs.reload()
        }
    }

    postHtmlProcessor(file, target, reload = false) {
        const quiet = true
        try {
            const sourceFile = path.resolve(path.join('src', target, 'html', file))
            const destFile = path.resolve(path.join('packages', target, 'Resources/Private', file))
            const html = fs.readFileSync(sourceFile).toString('utf-8')

            const localOptions = {
                importers: [{
                    findFileUrl(url) {
                        if (url.startsWith('scss')) {
                            return (pathToFileURL(path.join(path.resolve('./src'), packageName, url)))
                        }
                        if (url.startsWith('./')) return null
                        if (url.startsWith('../')) return null
                        return (pathToFileURL(path.join(path.resolve('./node_modules'), url)))
                    }
                }]
            }

            // const destPath = path.resolve(path.join('packages', packageName, 'Resources/Private'))
            // const destFile = path.relative(path.resolve(path.join('src', packageName, 'html')), file)

            const result = this.posthtml()
                // .use(this.posthtmlScssToFile({
                //     'path': './packages/' + packageName + '/Resources/Public/Css/style.css',
                //     'src': 'src/' + packageName,
                //     'dest': './packages/' + packageName + '/Resources/Public/StyleSheets',
                //     'cssLink': {
                //         'tag': 'link', 'attrs': {
                //             'rel': 'stylesheet', 'href': '/typo3conf/ext/mono_site/Resources/Public/StyleSheets%s.css'
                //         }
                //     },
                //     'sass': localOptions
                // }, this.sass))
                .use(this.posthtmlInclude({root: path.join('src', target, 'html-modules')}))
                .process(html, {
                    xmlMode: true, sync: true, from: file
                }).html


            // let relativeFile = file.substring(
            //     file.length,
            //     path.resolve(localOptions.src).length
            // )
            // const originFile = path.join(destPath, destFile)
            // let origin

            this.writeContentToFile(result, destFile)

            if (reload) {
                exec(clearCacheCmd, () => {
                    this.bs.reload()
                })
            }

            return

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

    getPackageName(file) {
        return path.relative('./src', file).split('/')[0]
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

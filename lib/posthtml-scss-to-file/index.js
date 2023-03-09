var fs = require('fs')
var path = require('path')
var util = require('util')


module.exports = function posthtmlStyleToFile(options, sass) {
  var buf = ''

  return function (tree) {
    options = JSON.parse(JSON.stringify(options))
    const sourcePath = path.resolve(options.src)
    const destPath = path.resolve(options.dest)

    let relativeFile = tree.options.from.substring(tree.options.from.length, sourcePath.length)
    // relativeFile = path.basename(relativeFile, path.extname(relativeFile))
    let pos = relativeFile.lastIndexOf('.')

    let relativeCssFile = relativeFile.substr(0, pos < 0 ? relativeFile.length : pos)


    let destFile = path.join(destPath, relativeCssFile) + '.css'
    tree.match({tag: 'style', attrs: {type: 'text/scss'}}, function (node) {
      buf += node.content[0].trim() || ''

      return ''
    })

    if (buf) {
      if (options.sass) {
        options.sass.data = buf

        if (options.sass.sourceMap) {
          options.sass.outFile = destFile
        }
        const result = sass.renderSync(options.sass)

        writeContentToFile(result.css.toString(), destFile)

        if (options.sass.sourceMap) {
          writeContentToFile(JSON.stringify(result.map.toString()), destFile + '.map')
        }

        if (options.cssLink) {
          let cssLink = JSON.parse(JSON.stringify(options.cssLink))

          cssLink.attrs.href = util.format(options.cssLink.attrs.href, relativeCssFile)
          if (options.cssLink.attrs.identifier) {
            cssLink.attrs.identifier = util.format(options.cssLink.attrs.identifier, relativeCssFile)
          }
          let cssSection = {
            tag: 'f:section',
            attrs: {
              name: 'css',
            },
            content: ['{extraContent->f:format.raw()}']
          }
          cssSection.content.push(cssLink)

          tree.match({tag: 'html'}, function (node) {
            node.content.unshift(cssSection)
            node.content.unshift('\n')
            return node
          })
        }
      } else {
        destFile = destFile.substr(0, pos < 0 ? destFile.length : pos) + '.scss'
        writeContentToFile(buf, destFile)
      }
    }

    return tree
  }

  function writeContentToFile(data, file) {
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

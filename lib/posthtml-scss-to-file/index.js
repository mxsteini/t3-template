var fs = require('fs')
var path = require('path')


module.exports = function posthtmlStyleToFile(options, sass) {

  return function (tree) {
    options = JSON.parse(JSON.stringify(options))
    const destPath = options.destPath
    const packageName = options.packageName
    const relativeFile = options.relativeFile.replace('.html', '')
    const sections = []

    tree.match({tag: 'style', attrs: {type: 'text/scss'}}, function (node) {
      options.sass.data = node.content[0].trim() || ''

      if (options.sass.sourceMap) {
        options.sass.outFile = destFile
      }
      const result = sass.renderSync(options.sass)

      const section = node.attrs.section || ''
      const destFile = relativeFile + section

      sections.push({
        name:  node.attrs.section || 'html',
        destFile: destFile
      })

      writeContentToFile(result.css.toString(), path.join(destPath, destFile) + '.css')

      if (options.sass.sourceMap) {
        writeContentToFile(JSON.stringify(result.map.toString()), path.join(destPath, destFile) + '.css' + '.map')
      }

      return ''
    })

    for (const [, section] of Object.entries(sections)) {
      const asset = {
        tag: 'f:asset.css',
        attrs: {
          identifier: section.destFile,
          href: 'EXT:' + packageName + '/Resources/Public/Css/' + section.destFile + '.css'
        }
      }

      if (section.name === 'html') {
        tree.match({tag: 'html'}, function (node) {
          node.content.unshift(asset)
          node.content.unshift('\n')
          return node
        })
      } else {
        tree.match({tag: 'f:section', attrs: {name: section.name}}, function (node) {
          node.content.unshift(asset)
          node.content.unshift('\n')
          return node
        })
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

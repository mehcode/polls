'use strict'

View = require 'lib/views/view'

module.exports = class Index extends View

  container: '#container'

  template: require 'templates/index'

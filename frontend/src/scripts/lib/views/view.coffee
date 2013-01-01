#! Local extensions to `Chaplin.View` used throughout this project.
'use strict'

Chaplin = require 'chaplin'

module.exports = class View extends Chaplin.View

  getTemplateFunction: ->
    @template

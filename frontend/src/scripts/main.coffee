#! Defines the project dependencies.
'use strict'

require.config
  paths:
    # Collection of (extremely) useful utilities: <http://lodash.com/docs>.
    underscore: '../components/lodash/lodash'

    # Eases DOM manipulation.
    jquery: '../components/jquery/jquery'

    # Provides the JSON object for manipulation of JSON strings if not
    # already defined.
    json2: '../components/json3/lib/json3'

    # Set of components and conventions powering Chaplin.
    backbone: '../components/backbone/backbone'

    # Core framework powering the single-page application.
    chaplin: 'vendor/chaplin'

    # Micro-template directory.
    templates: '../templates'

  shim:
    backbone:
      exports: "Backbone"
      deps: [
        "jquery"
        "underscore"
        "json2"
      ]

#! Instantiates the application and begins the execution cycle.

require ['app'], (Application) ->
  new Application().initialize()

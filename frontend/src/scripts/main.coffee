#! Defines the project dependencies.
#!

require.config
  paths:
    # Collection of (extremely) useful utilities: <http://lodash.com/docs>.
    underscore: 'vendor/lodash'

    # Eases DOM manipulation.
    jquery: 'vendor/jquery'

    # Provides the JSON object for manipulation of JSON strings if not
    # already defined.
    json2: 'vendor/json3'

    # Core framework powering the single-page application.
    backbone: 'vendor/backbone'
    chaplin: 'vendor/chaplin'

    # Compiled template directory.
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
#!

require ['app'], (Application) ->
  app = new Application()
  app.initialize()

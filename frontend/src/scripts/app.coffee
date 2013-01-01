'use strict'

Chaplin = require 'chaplin'
routes  = require 'routes'

_ = require 'underscore'

#! The main object; represents the entirety of the app.
module.exports = class Application extends Chaplin.Application

  #! Initialize the application; set up the global context.
  initialize: ->
    # Initialize core
    @initDispatcher controllerSuffix: ''
    @initLayout()
    @initMediator()
    @initComposer()
    @initControllers()

    # Register all routes and start routing
    @initRouter routes

    # Freeze the object instance; prevent further changes
    Object.freeze? @

  initMediator: ->
    # TODO: Play with globals here.
    Chaplin.mediator.seal()

  initControllers: ->
    # TODO: Instantiate any global, persistent controllers here.

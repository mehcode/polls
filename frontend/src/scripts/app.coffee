#! Central application class for the project.
#!

Chaplin = require 'chaplin'
routes  = require 'config/routes'


#! The main object; represents the entirety of the app.
module.exports = class Application extends Chaplin.Application

    #! Right-most document title of the app.
    title: 'polls'

    #! Initialize the application; set up the global context.
    initialize: ->
        # Initialize core
        @initDispatcher()
        @initLayout()
        @initComposer()
        @initMediator()
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

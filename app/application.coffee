config = require 'config'
User = require 'models/user'
SessionsController = require 'controllers/sessions_controller'

# The application object.
module.exports = class Application extends Chaplin.Application
  initMediator: ->
    # Create a user property
    Chaplin.mediator.user = new User()
    Chaplin.mediator.apiURL = (path) ->
      # Set the base URL of your API in config.coffeeenv
      "#{config.api_url}#{path}"
    Chaplin.mediator.sessions_controller    = new SessionsController()
    super

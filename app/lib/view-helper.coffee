# Application-specific view helpers
jade.helpers =
  greeting: (name) ->
    "Welcome, #{name}!"
  loggedIn: ->
    Chaplin.mediator.user and Chaplin.mediator.user.get('id')

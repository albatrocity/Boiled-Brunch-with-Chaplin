SiteView = require 'views/layout/site_view'

module.exports = class Controller extends Chaplin.Controller
  # Compositions persist stuff between controllers.
  # You may also persist models etc.
  beforeAction: ->
    @compose 'site', SiteView
  initialize: ->
    super
    @current_user = Chaplin.mediator.user
View = require './view'
ErrorsCollection = require 'collections/errors_collection'
ErrorsView = require 'views/errors/errors_collection_view'
Error = require 'models/error'

module.exports = class FormView extends View
  autoRender: true
  regions:
    'errors': '.errors'
  initialize: ->
    super
    @errors = new ErrorsCollection()
    @subscribeEvent 'render_error', @renderError
  render: ->
    super
    @errors_view = new ErrorsView
      collection: @errors
      container: @$el.find('.errors')
      autoRender: true
    if @model
      @model.on "invalid", (model, error) =>
        console.log error
        @renderError(error)

  renderError: (error, model) ->
    @errors.reset()
    @errors_view.render()
    if typeof error is 'object'
      errorJSON = $.parseJSON(error.responseText)
      for error in errorJSON
        errorObj =
          text: error
        @errors.add(errorObj)
    else
      errorObj =
        text: error
      @errors.add(errorObj)
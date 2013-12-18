require 'lib/view-helper' # Just load the view helpers, no return value

module.exports = class View extends Chaplin.View
  # Auto-save `template` option passed to any view as `@template`.
  optionNames: Chaplin.View::optionNames.concat ['template']
  listen:
    'change model': 'updateView'

  # Precompiled templates function initializer.
  getTemplateFunction: ->
    @template

  initialize: (options) ->
    super
    @current_user = Chaplin.mediator.user if Chaplin.mediator.user
    if options and options.collection_view
      @collection_view = options.collection_view

  updateView: (model) ->
    if @textBindings
      attributes = _.keys model.changed
      _.each attributes, (attr) =>
        $el = @$el.find("[data-bind='#{attr}']") # eew
        if $el.length
          if @model.get(attr) is undefined
            $el.text ''
          else
            $el.text @model.get(attr)
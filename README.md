# Boiled Brunch with Chaplin

A decent starting point for a stand-alone Chaplin app that communicates with an external API. Has some basic token-based auth. This is for my own convenience, but anyone's welcome to hack away at it.

## "Features"

* Base Models, Views, Collections
* Basic model/view binding when `view.textBindings` is true.
  * Fires on model's `change` event. Looks for template elements with `data-bind='MODEL_ATTRIBUTE_NAME'` attributes. For example, `h1.title(data-bind='title')` will reflect the title when it changes in the model.
* Jade for templates instead of Handlebars
* Configurable API URL for testing locally/building with different endpoints.
* Basic FormView - recommended for any forms that have validation or submit errors.
  * Renders errors in a ErrorsCollectionView
    * on `invalid` event on its model.
    * on `render_error` event. ex: `Chaplin.mediator.publish 'render_error', "Title can't be blank"`
* Basic SiteView
  * Renders flash messages on `flash_message` event. ex: `Chaplin.mediator.publish 'flash_message', 'Logged in'`. Auto-dispose after model's `lifespan` property.
* Basic User model
* Basic UserSession model
* LoginView: pass it a UserSession model. Submitting the form will defer to Chaplin.mediator.sessions_controller
* SessionsController:
  * TOKEN-based Auth. Check out this Rails [UsersController](https://github.com/cremalab/suite_api/blob/master/app/controllers/users_controller.rb) and this [ApplicationController](https://github.com/cremalab/suite_api/blob/master/app/controllers/application_controller.rb) for an example of token-based auth.
  * listens for 'login' event from LoginView. POSTs credentials to API and handles response.
  * Stores server response (usually a User's JSON) in both Chaplin.mediator.user and in localStorage via store-js. Persists over page refreshes.
  * Handle logout

## Dev Setup

Set your development and production API urls in `app/config.coffeeenv`

* `npm install brunch -g`
* `npm install`
* `bower install`
* `brunch watch --server`

To build for production, run `PRODUCTION=true brunch b --production`

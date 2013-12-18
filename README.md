# Boiled Brunch with Chaplin

A decent starting point for a stand-alone Chaplin app that communicates with an external API. Has some basic token-based auth. This is for my own convenience, but anyone's welcome to hack away at it.

## "Features"

* Base Models, Views, Collections
* Basic [model/view binding][binding] when `view.textBindings` is true.
  * Fires on model's `change` event. Looks for template elements with `data-bind='MODEL_ATTRIBUTE_NAME'` attributes. For example, `h1.title(data-bind='title')` will reflect the title when it changes in the model.
* [Jade][jade] for templates instead of Handlebars
  * Includes [Helpers][helpers] which can be [used in templates][helpedtmpl].
* [Configurable API URL][config] for testing locally/building with different endpoints using [js-env][jsenv]
* [Basic FormView][formview] - recommended for any forms that have validation or submit errors.
  * Renders errors in a ErrorsCollectionView
    * on `invalid` event on its model.
    * on `render_error` event. ex: `Chaplin.mediator.publish 'render_error', "Title can't be blank"`
* [Basic SiteView][siteview]
  * Renders [flash messages][flash] on `flash_message` event. ex: `Chaplin.mediator.publish 'flash_message', 'Logged in'`. Auto-dispose after model's `lifespan` property.
* [Basic User model][user]
* [Basic UserSession model][session]
* [LoginView][loginview] - pass it a UserSession model. Submitting the form will defer to Chaplin.mediator.sessions_controller
* [SessionsController][sessioncontroller]:
  * TOKEN-based Auth. Check out this Rails [UsersController][usercontroller] and this [ApplicationController][appcontroller] for an example of token-based auth.
  * [listens][loginlisten] for 'login' event from LoginView. POSTs credentials to API and handles response.
  * [Stores server response][sessionstore] (usually a User's JSON) in both [Chaplin.mediator.user][meduser] and in localStorage via [store-js][store]. Persists over page refreshes.
  * [Handle logout][logout]

## Dev Setup

Set your development and production API urls in `app/config.coffeeenv`

* `npm install brunch -g`
* `npm install`
* `bower install`
* `brunch watch --server`

To build for production, run `PRODUCTION=true brunch b --production`

[binding]: https://github.com/albatrocity/Boiled-Brunch-with-Chaplin/blob/master/app/views/base/view.coffee#L19-L28 "basic view/model binding"
[jade]: https://github.com/brunch/jade-brunch
[config]: https://github.com/albatrocity/Boiled-Brunch-with-Chaplin/blob/master/app/config.coffeeenv
[jsenv]: https://github.com/rcs/jsenv-brunch
[helpers]: https://github.com/albatrocity/Boiled-Brunch-with-Chaplin/blob/master/app/lib/view-helper.coffee
[helpedtmpl]: https://github.com/albatrocity/Boiled-Brunch-with-Chaplin/blob/master/app/views/home/templates/home.jade
[formview]: https://github.com/albatrocity/Boiled-Brunch-with-Chaplin/blob/master/app/views/base/form_view.coffee
[siteview]: https://github.com/albatrocity/Boiled-Brunch-with-Chaplin/blob/master/app/views/layout/site_view.coffee
[flash]: https://github.com/albatrocity/Boiled-Brunch-with-Chaplin/blob/master/app/models/flash_message.coffee
[user]: https://github.com/albatrocity/Boiled-Brunch-with-Chaplin/blob/master/app/models/user.coffee
[session]: https://github.com/albatrocity/Boiled-Brunch-with-Chaplin/blob/master/app/models/user_session.coffee
[loginview]: https://github.com/albatrocity/Boiled-Brunch-with-Chaplin/blob/master/app/views/user_sessions/login_view.coffee
[sessioncontroller]: https://github.com/albatrocity/Boiled-Brunch-with-Chaplin/blob/master/app/controllers/sessions_controller.coffee
[usercontroller]: https://github.com/cremalab/suite_api/blob/master/app/controllers/users_controller.rb
[appcontroller]: https://github.com/cremalab/suite_api/blob/master/app/controllers/application_controller.rb
[loginlisten]: https://github.com/albatrocity/Boiled-Brunch-with-Chaplin/blob/master/app/controllers/sessions_controller.coffee#L9
[sessionstore]: https://github.com/albatrocity/Boiled-Brunch-with-Chaplin/blob/master/app/controllers/sessions_controller.coffee#L33-L42
[meduser]: https://github.com/albatrocity/Boiled-Brunch-with-Chaplin/blob/master/app/application.coffee#L9
[store]: https://github.com/marcuswestin/store.js/
[logout]: https://github.com/albatrocity/Boiled-Brunch-with-Chaplin/blob/master/app/controllers/sessions_controller.coffee#L20-L26
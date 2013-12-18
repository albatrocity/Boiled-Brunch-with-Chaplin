Error = require 'models/error'
Collection = require './base/collection'

module.exports = class ErrorsCollection extends Collection
  model: Error
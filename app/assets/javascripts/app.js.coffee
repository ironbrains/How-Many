'use strict'

@template = (path) ->
  "/assets/#{path}.html"

@app = angular.module 'HowManyApp', [
  'ngRoute'
  'ng-rails-csrf'
  'ngResource'
]
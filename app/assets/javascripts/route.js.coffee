@app.config [
  '$routeProvider',
  ($routeProvider) ->
    $routeProvider.
      when('/',
        controller: 'PagesIndexCtrl'
        templateUrl: @template('pages/index')
      ).
      otherwise(
        redirectTo: '/'
      )
  ]
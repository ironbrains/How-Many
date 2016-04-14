@app.config [
  '$routeProvider'
  ($routeProvider) ->
    $routeProvider.
      when('/',
        controller: 'PagesIndexCtrl'
        templateUrl: @template('pages/index')
      ).
      when('/profile',
        controller: 'ProfileCtrl'
        templateUrl: @template('users/profile')
      ).
      otherwise(
        redirectTo: '/'
      )
  ]
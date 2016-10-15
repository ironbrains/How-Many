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

@app.run [
  '$rootScope', '$location', 'AuthFactory'
  ($rootScope, $location, AuthFactory) ->
    $rootScope.$on '$locationChangeStart', (event, next, current) ->
      loggedIn = ['/', '/login', '/registration']
      loggedOut = ['/profile']
      if AuthFactory.isSignedIn()
        $location.path('/profile') if loggedIn.includes $location.path()
      else
        $location.path('/') if loggedOut.includes $location.path()
]
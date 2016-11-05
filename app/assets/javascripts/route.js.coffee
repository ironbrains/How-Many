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
  '$rootScope', '$location', '$auth'
  ($rootScope, $location, $auth) ->
    $rootScope.$on '$locationChangeStart', (event, next, current) ->
      loggedIn = ['/', '/login', '/registration']
      loggedOut = ['/profile']
      if $auth.isSignedIn()
        if loggedIn.includes $location.path()
          event.preventDefault()
          $location.path('/profile')
      else
        $location.path('/') if loggedOut.includes $location.path()
]
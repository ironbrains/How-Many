@app.config [
  '$routeProvider'
  ($routeProvider) ->
    $routeProvider
      .when('/',
        controller: 'PagesIndexCtrl'
        templateUrl: @template('pages/index')
      )
      .when('/dashboard',
        controller: 'ApplicationDashboardCtrl'
        templateUrl: @template('application/dashboard')
      )
      .when('/profile',
        controller: 'ProfileCtrl'
        templateUrl: @template('users/profile')
      )
      .otherwise(
        redirectTo: '/'
      )
]

@app.run [
  '$rootScope', '$location', '$auth', 'MenuFactory'
  ($rootScope, $location, $auth, MenuFactory) ->
    $rootScope.$on '$locationChangeStart', (event, next, current) ->
      MenuFactory.calcItems $location.path()
      loggedIn = ['/', '/login', '/registration']
      loggedOut = ['/dashboard', '/profile']
      if $auth.isSignedIn()
        if loggedIn.includes $location.path()
          event.preventDefault()
          $location.path('/dashboard')
      else
        $location.path('/') if loggedOut.includes $location.path()
]
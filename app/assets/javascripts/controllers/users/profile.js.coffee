@app.controller 'ProfileCtrl', [
  '$scope', '$location', 'AuthFactory'
  ($scope, $location, AuthFactory) ->
    if !AuthFactory.isSignedIn()
      $location.path('/')
]
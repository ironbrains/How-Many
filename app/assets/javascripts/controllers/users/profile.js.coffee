@app.controller 'ProfileCtrl', [
  '$scope', '$location', 'AuthFactory'
  ($scope, $location, AuthFactory) ->
    $scope.user = AuthFactory.current_user()
    console.log AuthFactory
]
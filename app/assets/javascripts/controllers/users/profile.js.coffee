@app.controller 'ProfileCtrl', [
  '$scope', '$location', '$auth'
  ($scope, $location, $auth) ->
    $scope.user = $auth.current_user()
]
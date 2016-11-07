@app.controller 'ProfileCtrl', [
  '$scope', '$auth'
  ($scope, $auth) ->
    $scope.user = $auth.current_user()
]
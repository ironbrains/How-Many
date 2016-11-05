@app.controller 'ProfileCtrl', [
  '$scope', '$location', '$auth'
  ($scope, $location, $auth) ->
    $scope.user = $auth.current_user()
    console.log $scope.user

    $scope.logout = ->
      $auth.logout()
]
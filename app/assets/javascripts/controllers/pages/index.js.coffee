@app.controller 'PagesIndexCtrl', [
  '$scope', '$http'
  ($scope, $http) ->
    $scope.header = 'Index Page'
    $scope.getUsers = () ->
      console.log 'Getting users'
      $http.get('/api/users/').then(
        (response) ->
          $scope.users = response.data

        (response) ->
          console.log 'Error'
      )

]
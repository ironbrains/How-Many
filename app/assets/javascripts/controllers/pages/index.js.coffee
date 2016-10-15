@app.controller 'PagesIndexCtrl', [
  '$scope', '$http', '$location'
  ($scope, $http, $location) ->
    $scope.$on 'auth:login', () ->
      $location.path('/profile')
    $scope.header = 'Index Page'
    $scope.getUsers = () ->
      $http.get('/api/users/').then(
        (response) ->
          $scope.users = response.data

        (response) ->
          console.log 'Error'
      )

]
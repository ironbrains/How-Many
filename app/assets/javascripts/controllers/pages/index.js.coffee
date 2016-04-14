@app.controller 'PagesIndexCtrl', [
  '$scope', '$http', '$location', 'AuthFactory'
  ($scope, $http, $location, AuthFactory) ->
    if AuthFactory.isSignedIn()
      $location.path('/profile')

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
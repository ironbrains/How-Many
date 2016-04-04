@app.directive 'signUp', ->
  restrict: 'E'
  templateUrl: @template('devise/sign_up')
  scope: {}
  replace: true
  controller: [
    '$scope', 'UserFactory'
    ($scope, UserFactory) ->
      $scope.submit = ->
        UserFactory.create({ user: $scope.user }).$promise.then(
          (data) ->
            console.log data
        )
        console.log $scope.user
  ]
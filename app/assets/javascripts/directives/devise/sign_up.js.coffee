@app.directive 'signUp', ->
  restrict: 'E'
  templateUrl: @template('devise/sign_up')
  scope: {}
  replace: true
  controller: [
    '$scope', 'AuthFactory'
    ($scope, AuthFactory) ->
      $scope.submit = ->
        AuthFactory.signUp($scope.user)
  ]
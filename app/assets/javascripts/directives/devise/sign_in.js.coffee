@app.directive 'signIn', ->
  restrict: 'E'
  templateUrl: @template('devise/sign_in')
  scope: {}
  replace: true
  controller: [
    '$scope', 'AuthFactory'
    ($scope, AuthFactory) ->
      $scope.submit = ->
        AuthFactory.login($scope.user)
  ]
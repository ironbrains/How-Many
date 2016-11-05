@app.directive 'signIn', ->
  restrict: 'E'
  templateUrl: @template('devise/sign_in')
  scope: {}
  replace: true
  controller: [
    '$scope', '$auth'
    ($scope, $auth) ->
      $scope.submit = ->
        $auth.login($scope.user)
  ]
@app.directive 'signUp', ->
  restrict: 'E'
  templateUrl: @template('devise/sign_up')
  scope: {}
  replace: true
  controller: [
    '$scope', '$auth'
    ($scope, $auth) ->
      $scope.submit = ->
        $auth.signUp($scope.user)
  ]
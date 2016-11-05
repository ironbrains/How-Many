@app.directive 'signOut', ->
  restrict: 'E'
  templateUrl: @template('devise/sign_out')
  scope: {}
  replace: true
  controller: [
    '$scope', '$auth'
    ($scope, $auth) ->
      $scope.signOut = ->
        $auth.logout()
  ]
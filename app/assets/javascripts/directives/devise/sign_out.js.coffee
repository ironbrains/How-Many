@app.directive 'signOut', ->
  restrict: 'E'
  templateUrl: @template('devise/sign_out')
  scope: {}
  replace: true
  controller: [
    '$scope', 'AuthFactory'
    ($scope, AuthFactory) ->
      $scope.signOut = ->
        AuthFactory.logout()
  ]
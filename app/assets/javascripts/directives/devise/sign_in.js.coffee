@app.directive 'signIn', ->
  restrict: 'E'
  templateUrl: @template('devise/sign_in')
  scope: {}
  replace: true
  controller: [
    '$scope'
    ($scope) ->
      $scope.submit = ->
        console.log $scope.user
  ]
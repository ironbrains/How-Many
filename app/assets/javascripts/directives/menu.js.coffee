@app.directive 'menu', ->
  restrict: 'E'
  templateUrl: @template('directives/menu')
  scope: {}
  replace: true
  controller: [
    '$scope', 'MenuFactory'
    ($scope, MenuFactory) ->
      $scope.menu = MenuFactory
  ]
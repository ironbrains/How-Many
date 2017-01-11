@app.directive 'editAccountModal', ->
  restrict: 'E'
  templateUrl: @template('directives/edit_account_modal')
  scope:
    account: '='
  replace: true
  controller: [
    '$scope', 'Account'
    ($scope, Account) ->

      $scope.save = ->
        Account.update(id: @account.id, account: @tmpAccount).$promise.then(
          (response) =>
            @account.name = response.name
            @close()
          (response) =>
            @close()
        )

      $scope.close = ->
        @account = null
        @shown = false

      $scope.$watch 'account', (newValue, oldValue) ->
        $scope.tmpAccount = angular.copy newValue
        if newValue
          $scope.className = ''
          $scope.style = { display: 'block' }
        else
          $scope.className = 'fade'
          $scope.style = {}
  ]
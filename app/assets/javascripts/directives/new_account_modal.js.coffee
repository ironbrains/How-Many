@app.directive 'newAccountModal', ->
  restrict: 'E'
  templateUrl: @template('directives/new_account_modal')
  scope:
    shown: '='
    addToList: '&'
  replace: true
  controller: [
    '$scope', 'Account'
    ($scope, Account) ->
      $scope.account = {}

      $scope.create = ->
        Account.create(account: @account).$promise.then(
          (response) =>
            @addToList({ newAccount: response })
            @close()
          (response) =>
            @close()
        )

      $scope.close = ->
        @account = {}
        @shown = false

      $scope.$watch 'shown', (newValue, oldValue) ->
        if newValue
          $scope.className = ''
          $scope.style = { display: 'block' }
        else
          $scope.className = 'fade'
          $scope.style = {}
  ]
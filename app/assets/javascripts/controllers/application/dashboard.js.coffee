ApplicationDashboardCtrl = ($scope, $auth, Dashboard, Account) ->
  $scope.user = $auth.current_user()
  Dashboard.index().$promise.then(
    (response) ->
      $scope.dashboard = response
  )

  $scope.addToList = (newAccount) ->
    newTotal = parseFloat(@dashboard.total) + parseFloat(newAccount.balance)
    @dashboard.total = newTotal.toFixed(1)
    @dashboard.accounts.push newAccount

  $scope.removeAccount = (account) ->
    Account.destroy(id: account.id).$promise.then(
      (response) =>
        index = @dashboard.accounts.indexOf account
        @dashboard.accounts.splice index, 1
      (response) =>
        alert 'Cannot remove'
    )

@app.controller 'ApplicationDashboardCtrl', ['$scope', '$auth', 'Dashboard', 'Account'
                                             ApplicationDashboardCtrl]
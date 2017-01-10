ApplicationDashboardCtrl = ($scope, $auth, Dashboard) ->
  $scope.user = $auth.current_user()
  Dashboard.index().$promise.then(
    (response) ->
      $scope.dashboard = response
  )

  $scope.addToList = (newAccount) ->
    newTotal = parseFloat(@dashboard.total) + parseFloat(newAccount.balance)
    @dashboard.total = newTotal.toFixed(1)
    @dashboard.accounts.push newAccount

@app.controller 'ApplicationDashboardCtrl',['$scope', '$auth', 'Dashboard', ApplicationDashboardCtrl]
ApplicationDashboardCtrl = ($scope, $auth, Dashboard) ->
  $scope.user = $auth.current_user()
  Dashboard.index().$promise.then(
    (response) ->
      console.log response
      $scope.dashboard = response
  )

@app.controller 'ApplicationDashboardCtrl',['$scope', '$auth', 'Dashboard', ApplicationDashboardCtrl]
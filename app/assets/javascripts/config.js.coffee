@app.config [
  '$httpProvider'
  ($httpProvider) ->
    $httpProvider.defaults.withCredentials = true
    $httpProvider.interceptors.push [
      '$q', '$location', '$localStorage'
      ($q, $location, $localStorage) ->
        request: (config) ->
          config.headers = config.headers or {}
          if $localStorage.auth_token
            config.headers.Authorization = 'Bearer ' + $localStorage.auth_token
          config
        responseError: (response) ->
          if response.status == 401 or response.status == 403
            $location.path '/signin'
          $q.reject response
    ]
]
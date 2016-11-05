@app.config [
  '$httpProvider'
  ($httpProvider) ->
    $httpProvider.defaults.withCredentials = true
    $httpProvider.interceptors.push [
      '$q', 'AuthCallbacks'
      ($q, AuthCallbacks) ->
        request: (config) ->
          config.headers ||= {}
          if window.localStorage.auth_token
            config.headers.Authorization = 'Bearer ' + window.localStorage.auth_token
          config
        responseError: (response) ->
          AuthCallbacks.error() if response.status == 401
          $q.reject response
    ]
]
@app.factory 'AuthFactory', [
  '$http', '$localStorage'
  ($http, $localStorage) ->
    current_user: () ->
      @_current_user

    signUp: (user) ->
      $http.post(
        '/api/users'
        { user: user }
        { dataType: 'json' }
      ).then(
        (response) =>
          window.localStorage.auth_token = response.data.auth_token
          @_current_user = response.data.current_user
          true
        (data) =>
          false
      )

    login: (user) ->
      $http.post(
        '/api/users/sign_in'
        { user: user }
        { dataType: 'json' }
      ).then(
        (response) =>
          window.localStorage.auth_token = response.data.auth_token
          @_current_user = response.data.current_user
          true
        (data) =>
          false
      )

    logout: () ->
      window.localStorage.auth_token = null
]
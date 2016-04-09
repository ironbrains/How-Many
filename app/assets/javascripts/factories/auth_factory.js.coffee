@app.factory 'AuthFactory', [
  '$rootScope', '$http'
  ($rootScope, $http) ->
    current_user: ->
      @_current_user

    isSignedIn: ->
      !!window.localStorage.auth_token

    signUp: (user) ->
      $http.post(
        '/api/users'
        { user: user }
        { dataType: 'json' }
      ).then(
        (response) =>
          @_successAuthCallback(response)
        (response) =>
          @_errorAuthCallback(response)
      )

    login: (user) ->
      $http.post(
        '/api/users/sign_in'
        { user: user }
        { dataType: 'json' }
      ).then(
        (response) =>
          @_successAuthCallback(response)
        (response) =>
          @_errorAuthCallback(response)
      )

    logout: () ->
      @_errorAuthCallback()

    _successAuthCallback: (response) ->
      window.localStorage.auth_token = response.data.auth_token
      @_current_user = response.data.current_user
      $rootScope.$emit 'auth:login'

    _errorAuthCallback: (response = null) ->
      window.localStorage.auth_token = ''
      @_current_user = null
      $rootScope.$emit 'auth:logout'
]
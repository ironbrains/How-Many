@app
.factory 'AuthCallbacks', [
  '$location'
  ($location) ->
    success: (response) ->
      window.localStorage.auth_token = response.data.auth_token
      window.localStorage.current_user = response.data.current_user
      $location.path('/profile')

    error: (response = null) ->
      window.localStorage.auth_token = ''
      window.localStorage.current_user = ''
      $location.path('/')

]

.factory '$auth', [
  '$rootScope', '$http', 'User', 'AuthCallbacks'
  ($rootScope, $http, User, AuthCallbacks) ->
    current_user: ->
      window.localStorage.current_user

    isSignedIn: ->
      !!window.localStorage.auth_token

    signUp: (user) ->
      $http.post(
        '/api/users'
        { user: user }
        { dataType: 'json' }
      ).then(
        (response) ->
          AuthCallbacks.success response
        (response) ->
          AuthCallbacks.error response
      )

    login: (user) ->
      $http.post(
        '/api/users/sign_in'
        { user: user }
        { dataType: 'json' }
      ).then(
        (response) ->
          AuthCallbacks.success response
        (response) ->
          AuthCallbacks.error response
      )

    logout: () ->
      AuthCallbacks.error()

]
@app.factory 'AuthFactory', [
  '$http', '$localStorage'
  ($http, $localStorage) ->
    signUp: (user) ->
      $http.post(
        '/api/users'
        { user: user }
        { dataType: 'json' }
      ).then(
        (response) ->
          window.localStorage.auth_token = response.data.auth_token
          console.log $localStorage.auth_token, response.data.auth_token
        (data) ->
          console.log 'Error'
      )
    login: (user) ->
      $http.post(
        '/api/users/sign_in'
        { user: user }
        { dataType: 'json' }
      ).then(
        (response) ->
          window.localStorage.auth_token = response.data.auth_token
          console.log $localStorage.auth_token, response.data.auth_token
        (data) ->
          console.log 'Error'
      )
]
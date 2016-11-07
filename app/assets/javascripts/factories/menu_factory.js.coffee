menu_factory = ($auth) ->
  setItems: ->
    @items = 
      if $auth.isSignedIn()
        [
          {
            label: 'Dashboard'
            link: '/profile'
            action: ->
              alert 'Hello World'
          }
          {
            label: 'Sign Out'
            link: ''
            action: ->
              $auth.logout()
          }
        ]
      else
        [
          {
            label: 'Sign in'
            link: '/sign_in'
            action: ->
              null
          }
          {
            label: 'Sign Up'
            link: '/sign_up'
            action: ->
              null
          }
        ]
  calcItems: (path) ->
    @setItems()
    @items.forEach (item) ->
      item.isActive = (path == item.link)

@app
.factory 'MenuFactory', ['$auth', menu_factory]
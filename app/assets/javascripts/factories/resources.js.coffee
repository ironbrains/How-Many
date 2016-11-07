UserFactory = ($resource) ->
  $resource '/api/users/:id', { id: '@id', format: 'json' },
    index:  { method: 'GET', isArray: true }
    show:   { method: 'GET' }
    create: { method: 'POST' }
    update: { method: 'PUT' }

AccountFactory = ($resource) ->
  $resource '/api/accounts/:id', { id: '@id', format: 'json' },
    index:  { method: 'GET', isArray: true }
    show:   { method: 'GET' }
    create: { method: 'POST' }
    update: { method: 'PUT' }


DashboardFactory = ($resource) ->
  $resource '/api/dashboards/', { format: 'json' },
    index:  { method: 'GET' }

@app
.factory 'User', ['$resource', UserFactory]
.factory 'Account', ['$resource', AccountFactory]
.factory 'Dashboard', ['$resource', DashboardFactory]
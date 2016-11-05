user_factory = ($resource) ->
  $resource '/api/users/:id', { id: '@id', format: 'json' },
    index:  { method: 'GET', array: true }
    show:   { method: 'GET' }
    create: { method: 'POST' }
    update: { method: 'PUT' }

@app
.factory 'User', ['$resource', user_factory]
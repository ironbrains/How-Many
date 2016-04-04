@app.factory 'UserFactory', [
  '$resource'
  ($resource) ->
    $resource '/api/users/:id/:action', { id: '@id' },
      index: { method: 'GET' }
      show: {method: 'GET' }
      create:
        method: 'POST'
        # transformResponse: transformResponse
      update: { method: 'PUT'}
      destroy: { method: 'DELETE' }
]

# transformResponse = (data, headers) ->
#   data: data
#   headers: headers()
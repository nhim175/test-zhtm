app.factory 'Users', ($resource, Setting) ->
  $resource(Setting.apiURL() + '/api/users')
  

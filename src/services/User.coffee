app.service 'Users', ($resource, Setting, UserService) ->

  @resource = ->
    if !UserService.getToken()
      $resource(Setting.apiURL() + '/api/users')
    else
      $resource(Setting.apiURL() + '/api/users/?token=' + UserService.getToken())
  
  @

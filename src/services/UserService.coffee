app.service 'UserService', ($http, Setting) ->

  current = null;
  _token = null;

  @login = (username, password, callbacks) ->
    # TODO: fake login
    $http.post(Setting.apiURL() + '/api/login', 
      username: username
      password: password
    ).then(callbacks.success, callbacks?.error)

  @getCurrent = -> current

  @setCurrent = (user) -> current = user

  @setToken = (token) -> _token = token

  @getToken = (token) -> _token

  @
  

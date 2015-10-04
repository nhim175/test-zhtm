app.service 'UserService', ->

  @current = null;

  @login = (email, password, callbacks) ->
    # TODO: fake login
    @setCurrent(email: email)
    callbacks.success @getCurrent()

  @getCurrent = -> @current

  @setCurrent = (user) -> @current = user

  @
  

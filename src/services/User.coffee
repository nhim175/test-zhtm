app.service 'User', ->

  @current = null;

  @login = (email, password) -> 
    @setCurrent(email: email)
    true

  @getCurrent = -> @current

  @setCurrent = (user) -> @current = user
  

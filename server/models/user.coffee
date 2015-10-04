_ = require 'lodash'

class User

  users = [
    { id: 1, username: 'nhim175', email: 'nhim175@gmail.com', password: '4297f44b13955235245b2497399d7a93' } #123123
    { id: 2, username: 'test', email: 'test@example.com', password: '4297f44b13955235245b2497399d7a93' }
  ]

  @all: -> 
    _.clone(users, true)

  @find: (id) ->
    _.find @all(), (user) -> user.id == parseInt(id)

  @removeSensitiveData: (user) ->
    delete user.password
    user

module.exports = User
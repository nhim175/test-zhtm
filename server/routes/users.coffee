express = require 'express'
_ = require 'lodash'

router = express.Router()

mock_users = [
  { id: 1, username: 'nhim175', email: 'nhim175@gmail.com', password: '4297f44b13955235245b2497399d7a93' } #123123
  { id: 2, username: 'test', email: 'test@example.com', password: '4297f44b13955235245b2497399d7a93' }
]

removeSensitiveData = (user) ->
  delete user.password
  user

router.route('/users').get (req, res) ->

  users = _.map mock_users, removeSensitiveData

  res.json(users)

module.exports = router
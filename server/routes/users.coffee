express = require 'express'
_ = require 'lodash'

User = require '../models/user'

router = express.Router()

router.route('/users').get (req, res) ->

  users = _.map User.all(), User.removeSensitiveData

  res.json(users)

module.exports = router
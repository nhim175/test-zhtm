express = require 'express'
crypto = require 'crypto'
_ = require 'lodash'
jwt = require 'jsonwebtoken'

User = require '../models/user'
Setting = require '../models/setting'

router = express.Router()

failResponse =
  status: "failed"
  # TODO: reason why failed?

jwtPrivateKey = Setting.jwtPrivateKey

router.route('/login').post (req, res) ->

  username = req.body.username
  password = crypto.createHash('md5').update(req.body.password).digest('hex')

  # TODO: Login logic should be in Login model
  user = _.find User.all(), (user) ->
    user.username = username

  return res.json(failResponse) if user?.password isnt password

  # if login OK
  payload =
    id: user.id

  token = jwt.sign(payload, jwtPrivateKey)

  res.json
    status: "success"
    user: User.removeSensitiveData(user)
    token: token

module.exports = router
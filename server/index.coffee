express = require 'express'
bodyParser = require 'body-parser'
jwt = require 'jsonwebtoken'

users = require './routes/users'
auth = require './routes/auth'

User = require './models/user'
Setting = require './models/setting'

app = express()

# Allow cross-origin requests
app.use (req, res, next) ->
  res.header("Access-Control-Allow-Origin", "*")
  res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept")
  next()

app.use(bodyParser.json())
app.use(bodyParser.urlencoded())

# Auth check
app.use (req, res, next) ->
  # TODO: only auth check for secured api

  return next() if req.path is '/api/login'

  token = req.query.token
  
  try 
    payload = jwt.verify(token, Setting.jwtPrivateKey)
    id = payload.id
    user = User.find(id)
    if !user
      return res.json
        status: "failed"
        message: "unauthorized"
    else
      return next()

  catch e
    res.json
      status: "failed"
      message: "unauthorized"

app.use('/api', users)
app.use('/api', auth)

app.set('port', process.env.PORT or 3001)

server = app.listen app.get('port'), ->
  console.log "Express server is listening on port #{server.address().port}"
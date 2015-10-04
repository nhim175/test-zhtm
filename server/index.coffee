express = require 'express'
bodyParser = require 'body-parser'

users = require './routes/users'
auth = require './routes/auth'

app = express()

# Allow cross-origin requests
app.use (req, res, next) ->
  res.header("Access-Control-Allow-Origin", "*")
  res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept")
  next()

app.use(bodyParser.json())
app.use(bodyParser.urlencoded())

app.use('/api', users)
app.use('/api', auth)

app.set('port', process.env.PORT or 3001)

server = app.listen app.get('port'), ->
  console.log "Express server is listening on port #{server.address().port}"
express = require 'express'
users = require './routes/users'

app = express()

# Allow cross-origin requests
app.use (req, res, next) ->
  res.header("Access-Control-Allow-Origin", "*")
  res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept")
  next()

app.use('/api', users)

app.set('port', process.env.PORT or 3001)

server = app.listen app.get('port'), ->
  console.log "Express server is listening on port #{server.address().port}"
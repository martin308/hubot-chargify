module.exports = (robot) ->
  robot.router.post '/hubot/chargify/webhook', (req, res) ->
    data = req.body
    console.log data.payload
    handlerName = './handlers/' + data.event

    try
      handler = require handlerName
    catch e
      console.log e

    if handler?
      handler data.payload, robot

    res.end 'Thanks'

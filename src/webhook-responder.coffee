module.exports = (robot) ->
  robot.router.post '/hubot/chargify/webhook/:room_id', (req, res) ->
    data = req.body
    room_id = req.params.room_id
    handlerName = './handlers/' + data.event

    try
      handler = require handlerName
    catch e
      console.log e

    speak = (msg) ->
      robot.messageRoom room_id, msg

    if handler?
      handler speak, data.payload

    res.end 'Thanks'

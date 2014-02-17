module.exports = (robot) ->
  robot.router.post = 'hubot/chargify/webhook', (req, res) ->
    data = req.body
    res.end 'Thanks'

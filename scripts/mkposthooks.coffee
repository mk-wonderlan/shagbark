requestify = require('requestify');

module.exports = (robot) ->

  robot.router.post "/shagbark/music", (req, res) ->

    res.send 200
    push = req.body
    user = {}
    user.room = "#mammaskallare"
    robot.send user, "Now Playing: #{push.song} by #{push.artist} from album '#{push.album}'"

  robot.respond /(.*)/i, (msg) ->

    requestify.post('http://webdump.shagbark.ninja', {message: msg.match[1]},{dataType: 'json'})



  #  msg.http("http://webdump.shagbark.ninja/ircmessage")
  #  .headers('Content-Type': 'application/json')
  #  .post(JSON.Stringify(data)) (err, res, body) ->
    #  msg.send err

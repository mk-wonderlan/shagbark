module.exports = (robot) ->

  robot.router.post "/shagbark/music", (req, res) ->

    res.send 200
    push = req.body
    user = {}
    user.room = "#mammaskallare"
    robot.send user, "Now Playing: #{push.song} by #{push.artist} from album '#{push.album}'"

  robot.respond /(.*)/i, (msg) ->

    data = '{"message": msg.match[1]}'

    msg.http("http://webdump.shagbark.ninja/ircmessage")
    .headers('Content-Type': 'application/json')
    .post(data) (err, res, body) ->
      msg.send err

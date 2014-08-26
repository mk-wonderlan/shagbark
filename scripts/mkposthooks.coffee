module.exports = (robot) ->

  robot.router.post "/shagbark/music", (req, res) ->

    res.send 200
    push = req.body
    user = {}
    user.room = "#mammaskallare"
    robot.send user, "Now Playing: #{push.song} by #{push.artist} from album '#{push.album}'"

  robot.respond /(.*)/i, (msg) ->

    data = querystring.stringify({"message": msg.match[1]})
    options = {host:'webdump.shagbark.ninja',port: '80',path: '/ircmessage',method: 'POST',headers: {'Content-Type': 'application/json','Content-Length': data.length}};
    request = http.request(options)
    request.write(data);
    request.end();


  #  msg.http("http://webdump.shagbark.ninja/ircmessage")
  #  .headers('Content-Type': 'application/json')
  #  .post(JSON.Stringify(data)) (err, res, body) ->
    #  msg.send err

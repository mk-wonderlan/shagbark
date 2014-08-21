module.exports = (robot) ->
  robot.respond /(?:give me |gimme )?(?:al)?paca(?: my bag)?(?:s)?/i, (msg) ->
    if robot.auth.hasRole(msg.envelope.user,'shagbarks friend')
      rnd = Math.floor(Math.random() * 20)
      msg.http("http://api.tumblr.com/v2/tagged/?tag=alpaca&api_key=Vfbj0WK0KV2DiOa83X4alREVgTkItGvdj0fcccFRHvOyHIKECz")
        .get() (err, res, body) ->
          msg.send "[DEBUG]" + JSON.parse(body)

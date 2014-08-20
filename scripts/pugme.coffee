# Description:
#   Pugme is the most important thing in your life
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot pug me - Receive a pug
#   hubot pug bomb N - get N pugs

module.exports = (robot) ->

  robot.respond /pug me/i, (msg) ->
    if robot.auth.hasRole(user,'shagbarks friend')
      msg.http("http://pugme.herokuapp.com/random")
        .get() (err, res, body) ->
          msg.send JSON.parse(body).pug

  robot.respond /pug bomb( (\d+))?/i, (msg) ->
    if robot.auth.hasRole(user,'shagbarks friend')
      count = msg.match[2] || 5
      msg.http("http://pugme.herokuapp.com/bomb?count=" + count)
        .get() (err, res, body) ->
          msg.send pug for pug in JSON.parse(body).pugs

  robot.respond /how many pugs are there/i, (msg) ->
    if robot.auth.hasRole(user,'shagbarks friend')
      msg.http("http://pugme.herokuapp.com/count")
        .get() (err, res, body) ->
          msg.send "There are #{JSON.parse(body).pug_count} pugs."

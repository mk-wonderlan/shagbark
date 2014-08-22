# Description:
#   Generates help commands for Hubot.
#
# Commands:
#   hubot help - Displays all of the help commands that Hubot knows about.
#   hubot help <query> - Displays all help commands that match <query>.
#
# URLS:
#   /hubot/help
#
# Notes:
#   These commands are grabbed from comment blocks at the top of each file.
postmark = require('postmark')(process.env.POSTMARK_API_KEY)

module.exports = (robot) ->
	robot.respond /(?:email |mail )((([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,})))/i, (msg) ->
		if robot.auth.hasRole(msg.envelope.user,'shagbarks friend')
		  mail = {"From": 'courier@shagbark.ninja',"To": msg.match[1],"Subject": "Hello from PostMark",TextBody: "Hello!",Tag: "test"}

			postmark.send mail, (err, to) ->
			  	if err
			    	msg.reply "Unable to send via postmark: " + error.message
						return

			  	msg.reply "Email sent to " +to

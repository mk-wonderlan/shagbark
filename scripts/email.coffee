postmark = require 'postmark', process.env.POSTMARK_API_KEY

module.exports = (robot) ->
	robot.respond /(?:email |mail )((([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,})))/i, (msg) ->
		if robot.auth.hasRole(msg.envelope.user,'shagbarks friend')
		  mail = {}
			mail.From = 'courier@shagbark.ninja'
			mail.To = msg.match[1]
			mail.Subject = "Hello from PostMark"
			mail.TextBody = "Hello!"
			mail.Tag = "test"
			response = ""
			response += mail.From
			response += "\n"
			response += mail.To
			response += "\n"
			response += mail.Subject
			response += "\n"
			response += mail.TextBody
			response += "\n"
			response += mail.Tag
			msg.reply response
		#	postmark.send mail, (error, success) ->
			  #	if error
			    #	console.error "Unable to send via postmark: " + error.message
			    #	return
			  	#console.info "Sent to postmark for delivery"
			  	#return

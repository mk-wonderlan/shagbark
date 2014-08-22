postmark = require("postmark")(process.env.c3809d30-f23a-49bc-b1e6-36775d6b4583)
module.exports = (robot) ->
	robot.respond /(?:email |mail )/i, (msg) ->
		if robot.auth.hasRole(msg.envelope.user,'shagbarks friend')
			postmark.send
			  From: "courier@shagbark.ninja"
			  To: "msg"
			  Subject: "Hello from Postmark"
			  TextBody: "Hello!"
			  Tag: "test"
			, (error, success) ->
			  if error
			    console.error "Unable to send via postmark: " + error.message
			    return
			  console.info "Sent to postmark for delivery"
			  return





require 'rubygems'
require 'twilio-ruby'

# Get your Account Sid and Auth Token from twilio.com/user/account
account_sid = 'ACd44c89dbeb30e2dffb63bc5efcd8ff13'
auth_token = ENV[TWILIO_KEY]
@client = Twilio::REST::Client.new account_sid, auth_token
message = @client.account.messages.create(:body => "Testing twilio",
:to => ENV[TWILIO_NUM]
:from => "+441871851019") # Replace with your Twilio number
puts message.sid
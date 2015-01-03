require 'rubygems'
require 'twilio-ruby'

module Twilio

  account_sid = 'ACd44c89dbeb30e2dffb63bc5efcd8ff13'
  auth_token = ENV['TWILIO_KEY']
  @client = Twilio::REST::Client.new account_sid, auth_token
  
  def send_sms(text)
    message = @client.account.messages.create(
    :body => text,
    :to => ENV['TWILIO_NUM'],
    :from => "+441871851019"
    )
    puts message.sid
  end

end
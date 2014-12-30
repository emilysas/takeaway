require 'rubygems'
require 'twilio-ruby'
require_relative 'menu'
require 'time'

class Order

  def delivery_time
    t = Time.now + (60*60)
    time = "#{t.hour}:#{t.min}"
  end

  def send_text
    account_sid = 'ACd44c89dbeb30e2dffb63bc5efcd8ff13'
    auth_token = ENV[TWILIO_KEY]
    @client = Twilio::REST::Client.new account_sid, auth_token
    message = @client.account.messages.create(
      :body => "Thank you for your order, this should be delivered to you by #{delivery_time}",
      :to => ENV[TWILIO_NUM],
      :from => "+441871851019") 
    puts message.sid
  end 

end
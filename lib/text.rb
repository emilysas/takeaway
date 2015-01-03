require_relative 'twilio'
require 'time'

module Text

  include Twilio
  include Time

  def delivery_time
    t = Time.now + (60*60)
    time = "#{t.hour}:#{t.min}"
  end

  def send_text
    send_sms("Thank you for your order, this should be delivered to you by #{delivery_time}")
  end 

end

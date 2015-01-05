require_relative 'twilio'
require 'time'

module Text

  include Twilio

  def delivery_time
    t = Time.now
    time = t.strftime("%I:%M%p")
  end

  def send_text
    send_sms("Thank you for your order, this should be delivered to you by #{delivery_time}")
  end 

end

require 'rubygems'
require 'twilio-ruby'
require 'time'
require 'menu'

class Order

  include Menu

  def initialize
    @order = []
    @menu = [{name: "onion bhaji", price: 2.45}, {name: "vegetable somosa", price: 2.45}, {name: "garlic mushrooms", price: 2.50}, {name: "aloo chat", price: 2.60}, {name: "paneer tikka", price: 3.95}, {name: "paneer shashlik", price: 6.25}, {name: "vegetable balti", price: 6.75}, {name: "vegetable roshney", price: 5.85}, {name: "vegetable pasanda", price: 5.85}, {name: "vegetable jalfrezi", price: 5.85}, {name: "vegetable damask", price: 5.35}, {name: "vegetable pathia", price: 5.35}, {name: "vegetable korai", price: 5.85}, {name: "vegetable muglai", price: 5.95}, {name: "vegetable korma", price: 5.35}, {name: "boiled rice", price: 2.00}, {name: "pilau rice", price: 2.25}, {name: "plain naan", price: 1.85}, {name: "peshwari naan", price: 2.20}]
  end

  def take_order 
    receive_order
    get_total
  end

  def receive_order
    puts 'What would you like to order?'
    order = STDIN.gets.chomp
    while !order.empty? do
      @menu.find{|menu_item| menu_item[:name] == order; @order << menu_item}
      receive_order
      break
    end
  end

  def show_order
    @order
  end

  def get_total
    puts 'Please calculate the order total'
    total_est = STDIN.gets.chomp.to_f
    compare_total(total_est)
  end

  def compare_total(estimate)
    if calculate_total == estimate 
      send_text 
    else
      raise "Please recalculate the total of your order"
      get_total
    end
  end

  def calculate_total
    prices = []
    @order.each {|menu_item| prices << menu_item[:price]}
    total = prices.inject{|memo, num| memo + num}
  end

  def delivery_time
    t = Time.now + (60*60)
    time = "#{t.hour}:#{t.min}"
  end

  def send_text
    account_sid = 'ACd44c89dbeb30e2dffb63bc5efcd8ff13'
    auth_token = ENV['TWILIO_KEY']
    @client = Twilio::REST::Client.new account_sid, auth_token
    message = @client.account.messages.create(
      :body => "Thank you for your order, this should be delivered to you by #{delivery_time}",
      :to => ENV['TWILIO_NUM'],
      :from => "+441871851019") 
    puts message.sid
  end 

end
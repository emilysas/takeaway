require_relative 'menu'
require_relative 'twilio'
require_relative 'order'

class Takeaway
  
  attr_reader :menu, :order

  def initialize
    @menu = Menu.new([{name: "onion bhaji", price: 2.45}, {name: "vegetable somosa", price: 2.45}, {name: "garlic mushrooms", price: 2.50}, {name: "aloo chat", price: 2.60}, {name: "paneer tikka", price: 3.95}, {name: "paneer shashlik", price: 6.25}, {name: "vegetable balti", price: 6.75}, {name: "vegetable roshney", price: 5.85}, {name: "vegetable pasanda", price: 5.85}, {name: "vegetable jalfrezi", price: 5.85}, {name: "vegetable damask", price: 5.35}, {name: "vegetable pathia", price: 5.35}, {name: "vegetable korai", price: 5.85}, {name: "vegetable muglai", price: 5.95}, {name: "vegetable korma", price: 5.35}, {name: "boiled rice", price: 2.00}, {name: "pilau rice", price: 2.25}, {name: "plain naan", price: 1.85}, {name: "peshwari naan", price: 2.20}])
    @order = Order.new(menu)
  end

  def take_customer_order
    order.ask_customer
  end

end

takeaway = Takeaway.new
takeaway.take_customer_order


require_relative 'menu'
require_relative 'twilio'
require_relative 'order'

class Takeaway
  
  attr_reader :menu, :order

  def initialize
    @menu = Menu.new([{name: "onion bhaji", price: 2.45}, {name: "vegetable somosa", price: 2.45}])
    @order = Order.new(menu)
  end

  def take_customer_order(choice)
    order.add_dish(choice)
  end

  def request_total(total)
    order.get_total(total)
  end

end

takeaway = Takeaway.new
takeaway.take_customer_order('onion bhaji')
takeaway.request_total(2.45)


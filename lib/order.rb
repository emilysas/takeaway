require 'rubygems'
require 'twilio-ruby'
require 'time'
require 'menu'

#What does this class do?
#1. It receives an order from a customer
#2. It asks the customer to estimate the total
#3. It calculates the total of the order
#4. It compares this total to the total estimated
#5. It calculates the delivery time
#6. It sends a text

class Order

  include Total

  attr_reader :order

  def initialize
    @order = []
  end

  def take_order 
    ask_customer
    get_total
  end

  def ask_customer
    puts 'What would you like to order?'
    order = STDIN.gets.chomp
    note
  end

  def note
    while !order.empty? do
      menu.stocked?(order) ? @order << order
      ask_customer
      break
    end
  end

end
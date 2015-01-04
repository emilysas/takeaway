require_relative 'menu'
require_relative 'total'
require_relative 'text'

class Order

  include Total
  include Text

  attr_reader :contents, :menu

  def initialize(menu)
    @contents = []
    @menu = menu
  end

  def take_order 
    ask_customer
    process_order
  end

  def process_order
    get_total
    correct? ? send_text : get_total
  end

  def ask_customer
    puts 'What would you like to order?'
    choice = STDIN.gets.chomp
    note_down(choice) unless choice.nil?
  end

  def note_down(choice)
    content = menu.find_item(choice)
    @contents << content 
  end

end
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
    content = menu.find_item(choice)
    note_down(content)
  end

  def in_stock(content)
    menu.check_stock(content)
  end

  def note_down(content)
    @contents << content unless content.nil? || !in_stock(content)
  end

end
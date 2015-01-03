require 'menu'
require 'total'
require 'text'

class Order

  # include Total
  # include Text

  attr_reader :contents, :menu

  def initialize(menu)
    @contents = []
    @menu = menu
  end

  # def take_order 
  #   ask_customer
  #   get_total
  #   correct? ? send_text : recalculate_total
  # end

  def ask_customer
    puts 'What would you like to order?'
    content = STDIN.gets.chomp
    note_down(content)
  end

  def in_stock(content)
    menu.check_stock(content)
  end

  def note_down(content)
    @contents << content unless content.nil? || !in_stock(content)
  end

end
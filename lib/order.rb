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

  def process_order(estimate)
    compare_total(estimate)
    send_text
  end

  def add_dish(choice)
    menu.check_stock(choice)
    note_down(choice)
  end

  def note_down(choice)
    content = menu.find_item(choice)
    @contents << content
  end

end
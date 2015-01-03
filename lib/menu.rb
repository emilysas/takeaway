class Menu

  def initialize(menu)
    @menu = menu
  end

  # def display_menu
  #   @menu.each {|menu_item| puts "#{menu_item[:name]}: £#{menu_item[:price].round(2)}"}
  # end

  def check_stock(choice)
    @chosen_item = @menu.find{|menu_item| menu_item[:name] == choice }
    @chosen_item ? stocked : not_stocked
  end

  def stocked?
    @stocked
  end

  def stocked
    @stocked = true
  end

  def not_stocked
    @stocked = false
    raise "Sorry, we do not sell this item"
  end

end
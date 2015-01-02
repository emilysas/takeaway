class Menu

  def initialize(menu ||= [])
    @menu = menu
  end

  def display_menu
    @menu.each {|menu_item| puts "#{menu_item[:name]}: £#{menu_item[:price].round(2)}"}
  end

  def in_stock(choice)
    stocked?(choice) ? show_price : not_stocked
  end

  def show_price
    @chosen_item[:price]
  end

  def stocked?(choice)
    @chosen_item = @menu.find{|menu_item| menu_item[:name] == choice }
  end

  def not_stocked
    raise "Sorry, we do not sell this item"
  end

end
module Menu

  def display_menu
    @menu.each {|menu_item| puts "#{menu_item[:name]}: £#{menu_item[:price].round(2)}"}
  end

  def show_price(choice)
    if takeaway_item = @menu.find{|menu_item| menu_item[:name] == choice }
      return takeaway_item[:price]
    else
      raise "Sorry, we do not sell this item"
    end
  end

end
 module Total

  def compare_total(estimate)
    correct = calculate_total == estimate 
    recalculate_total unless correct
    correct
  end

  def calculate_total
    prices = []
    contents.each {|menu_item| prices << menu_item[:price]}
    total = prices.inject{|memo, num| memo + num}
  end

  def recalculate_total
    raise "Please recalculate the total of your order"
  end

end
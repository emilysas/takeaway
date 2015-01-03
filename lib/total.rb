 module Total
  
  def ask_for_total
    puts 'Please calculate the order total'
    STDIN.gets.chomp
  end

  def get_total
    total_est = ask_for_total.to_f
    compare_total(total_est)
  end

  def compare_total(estimate)
    if calculate_total == estimate 
      @correct = true
    else
      @correct = false
    end
  end

  def correct?
    @correct
  end

  def calculate_total
    prices = []
    contents.each {|menu_item| prices << menu_item[:price]}
    total = prices.inject{|memo, num| memo + num}
  end

  # def recalculate_total
  #   raise "Please recalculate the total of your order"
  #   get_total
  # end

end
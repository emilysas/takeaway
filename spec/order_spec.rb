require 'order'
require 'menu'

describe Order do 

  let(:order){Order.new}

  xit 'can show the price of a menu item' do
    expect(order.show_price("onion bhaji")).to eq(2.45)
  end

  xit 'can inform the customer if a menu item doesn\'t exist' do

  end

  xit 'can take an order' do

  end

  xit 'will ask the customer to estimate the total' do

  end

  xit 'can calculate the order total' do

  end

  xit 'can send a text to the customer' do

  end

end
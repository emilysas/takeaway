require 'order'
require 'menu'

describe Order do 

  let(:order){Order.new}

  it 'can show the price of a menu item' do
    expect(order.show_price("onion bhaji")).to eq(2.45)
  end

  it 'can inform the customer if a menu item doesn\'t exist' do
    expect{order.show_price("chocolate")}.to raise_error(RuntimeError, "Sorry, we do not sell this item")
  end

  it 'can take an order' do
    order.take_order
    expect(order.show_order.size).to eq(1)
  end

  it 'will ask the customer to estimate the total' do
    order.take_order
    expect(order).to receive(:get_total)
  end

  it 'can calculate the order total' do
    expect(order.calculate_total).to eq(2.45)
  end

  xit 'can send a text to the customer' do

  end

end
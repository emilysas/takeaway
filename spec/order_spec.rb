require 'order'

describe Order do 

  let(:order){Order.new}

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
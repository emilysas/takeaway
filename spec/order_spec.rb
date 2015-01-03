require 'order'
require 'menu'

describe Order do 

  let(:order){ Order.new(menu)}
  let(:menu){double :menu}
  
  it 'can ask a customer for their order' do
    allow(STDIN).to receive(:gets) { 'onion bhaji' }
    allow(order).to receive(:in_stock){true}
    expect{order.ask_customer}.to change{order.contents}.to (['onion bhaji'])
  end

  it 'will check to see if stocked' do
    allow(STDIN).to receive(:gets) { 'vegetable somosa' }
    expect(menu).to receive(:check_stock).with('vegetable somosa')
    order.ask_customer
  end

  it 'will ask the customer to estimate the total' do
    allow(STDIN).to receive(:gets) { '2.45' }
    expect(order.process_order).to eq(2.45)
  end

  it 'can calculate the order total' do
    allow(order).to receive(:contents) { [{name: "onion bhaji", price: 2.45}, {name: "vegetable somosa", price: 2.45}] }
    expect(order.calculate_total).to eq(4.9)
  end

  # xit 'can send a text to the customer' do

  # end

end
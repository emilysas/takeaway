require 'order'
require 'menu'

describe Order do 

  let(:order){ Order.new(menu)}
  let(:menu){double :menu}
  
  it 'can take an order' do
    allow(STDIN).to receive(:gets) { 'onion bhaji' }
    allow(order).to receive(:in_stock){true}
    expect{order.ask_customer}.to change{order.contents}.to (['onion bhaji'])
  end

  it 'will check to see if stocked' do
    allow(STDIN).to receive(:gets) { 'vegetable somosa' }
    expect(menu).to receive(:check_stock).with('vegetable somosa')
    order.ask_customer
  end

  # xit 'will ask the customer to estimate the total' do

  # end

  # xit 'can calculate the order total' do

  # end

  # xit 'can send a text to the customer' do

  # end

end
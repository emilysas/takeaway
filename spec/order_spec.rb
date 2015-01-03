require 'order'
require 'menu'

describe Order do 

  let(:order){ Order.new(menu)}
  let(:menu){double :menu, stocked?: true}
  
  it 'can take an order' do
    allow(STDIN).to receive(:gets) { 'onion bhaji' }
    expect{order.ask_customer}.to change{order.contents}.to (['onion bhaji'])
  end

  # xit 'will ask the customer to estimate the total' do

  # end

  # xit 'can calculate the order total' do

  # end

  # xit 'can send a text to the customer' do

  # end

end
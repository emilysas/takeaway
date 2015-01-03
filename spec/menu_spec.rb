require 'menu'

describe Menu do
  
  let(:menu){ Menu.new([{name: "onion bhaji", price: 2.45}]) }

  it 'can inform the customer if a menu item doesn\'t exist' do
    expect(menu.check_stock("onion bhaji")).to eq(true)
  end

end
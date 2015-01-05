require 'menu'

describe Menu do
  
  let(:menu){ Menu.new([{name: "onion bhaji", price: 2.45}]) }

  it 'can check if a menu item is in stock' do
    expect(menu.check_stock("onion bhaji")).to eq({name: "onion bhaji", price: 2.45})
  end

  it 'can inform the customer if a menu item doesn\'t exist' do
    expect{menu.check_stock("beef")}.to raise_error("Sorry, we do not sell this item")
  end

end
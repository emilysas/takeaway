require 'menu'

describe Menu do
  let(:menu){Menu.new}
  
  it 'can show the price of a menu item' do
    expect(menu.show_price("onion bhaji")).to eq(2.45)
  end

  it 'can inform the customer if a menu item doesn\'t exist' do
    expect{menu.show_price("chocolate")}.to raise_error(RuntimeError, "Sorry, we do not sell this item")
  end

end
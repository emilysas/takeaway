require 'menu'

describe Menu do
  let(:menu){Menu.new}
  
  it 'can show the price of a menu item' do
    expect(menu.show_price(name: "vegetable_bhaji")).to eq(2.95)
  end

end
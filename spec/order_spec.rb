require 'order'

describe Order do 

  let(:order){ Order.new(menu)}
  let(:menu){double :menu, find_item: {:name => "onion bhaji", :price => 2.45} }
  
  context 'when taking order' do

      before{allow(menu).to receive(:check_stock).with('onion bhaji'){true}}

      it 'can ask a customer for their order' do
        expect{order.add_dish('onion bhaji')}.to change{order.contents}.to ([{name: 'onion bhaji', price: 2.45}])
      end

      it 'will check to see if stocked' do
        expect(menu).to receive(:find_item).with('onion bhaji')
        order.add_dish('onion bhaji')
      end

  end

  context 'order placed' do

    before{allow(order).to receive(:contents) { [{:name => "onion bhaji", :price => 2.45}, {name: "vegetable somosa", price: 2.45}] }}

      it 'can calculate the order total' do
        expect(order.calculate_total).to eq(4.9)
      end

    context 'estimate correct' do

      before{allow(order).to receive(:ask_for_total){4.9}}

        it 'can compare the customer\'s estimate with the actual total' do
          allow(order).to receive(:ask_for_total){4.9}
          expect{order.get_total}.to change{order.correct?}.to (true)
        end

        it 'can send a text to the customer' do
          allow(order).to receive(:ask_for_total){4.9}
          expect(order).to receive(:send_text)
          order.process_order
        end
    end

    context 'estimate wrong' do

      it 'can ask the customer to recalculate if estimate is wrong' do
        allow(order).to receive(:ask_for_total){4.8}
        expect{order.get_total}.to raise_error("Please recalculate the total of your order")
      end

    end

  end

end
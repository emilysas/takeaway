class Menu

  def initialize
    @menu = [{name: "onion bhaji", price: 2.45}, {name: "vegetable somosa", price: 2.45}, {name: "garlic mushrooms", price: 2.50}, {name: "aloo chat", price: 2.60}, {name: "paneer tikka", price: 3.95}, {name: "paneer shashlik", price: 6.25}, {name: "vegetable balti", price: 6.75}, {name: "vegetable roshney", price: 5.85}, {name: "vegetable pasanda", price: 5.85}, {name: "vegetable jalfrezi", price: 5.85}, {name: "vegetable damask", price: 5.35}, {name: "vegetable pathia", price: 5.35}, {name: "vegetable korai", price: 5.85}, {name: "vegetable muglai", price: 5.95}, {name: "vegetable korma", price: 5.35}]
  end

  def show_price(menu_item)
    @menu[name: menu_item][:price]
  end

end
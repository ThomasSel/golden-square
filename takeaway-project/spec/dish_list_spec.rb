require 'dish_list'

RSpec.describe DishList do
  context "after initialisation" do
    it "both getters return empty arrays" do
      dish_list = DishList.new
      expect(dish_list.list_available).to eq []
      expect(dish_list.all).to eq []
    end
  end

  it "list_available only returns available dishes" do
    dish_list = DishList.new
    dish_1 = double(:fake_dish, available?: true)
    dish_2 = double(:fake_dish, available?: false)
    dish_3 = double(:fake_dish, available?: true)
    dish_list.add(dish_1)
    dish_list.add(dish_1)
    dish_list.add(dish_2)
    dish_list.add(dish_3)
    expect(dish_list.list_available).to eq [dish_1, dish_3]
    expect(dish_list.all).to eq [dish_1, dish_2, dish_3]
  end
end
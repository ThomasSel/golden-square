require "dish_list"
require "dish"

RSpec.describe "DishList and Dish integration" do
  it "DishList correctly stores and returns avialable dishes" do
    dish_list = DishList.new
    dish_1 = Dish.new("Pizza", 5.0)
    dish_2 = Dish.new("Pasta", 4.0)
    dish_3 = Dish.new("Lasagne", 5.99)
    dish_4 = Dish.new("Cheese platter", 12.50)
    dish_3.set_availability!(false)
    dish_list.add(dish_1)
    dish_list.add(dish_2)
    dish_list.add(dish_2)
    dish_list.add(dish_3)
    dish_list.add(dish_4)
    expect(dish_list.list_available).to eq [dish_1, dish_2, dish_4]
    expect(dish_list.all).to eq [dish_1, dish_2, dish_3, dish_4]
  end
end
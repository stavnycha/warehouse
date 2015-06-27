# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

goods = {
  'Clothes'   => ['Socks', 'Jacket'],
  'Dishes'    => ['Cup', 'Plate', 'Knife', 'Spoon', 'Fork'],
  'Kitchen'   => ['Fridge', 'Kettle', 'Oven', 'Casserole', 'Pan', 'Cooking set', 'Roaster'],
  'Cosmetics' => ['Mascara', 'Face mask', 'Soap', 'Shampoo', 'Conditioner', 'Hair mask', 'Powder', 'Foundation', 'Lipstic']
}

goods.each do |category_name, items|
  category = Category.where(name: category_name).first_or_create
  
  items.each do |item|
    Product.where(
      name:        item, 
      description: 'Some description', 
      price:       10
    ).first_or_create do |p|
      p.categories = [category]
    end
  end
end
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

initial_foods = [
	      {:user_name_id => 1, :food_name => 'Cauliflower',
	      :expires_on => '13-Feb-2013', :qty => 1, :acquired_on => '2-Jan-2013', :price => 4.53, :brand => 'Trader Joes', :food_type => 'Vegetables, Fruits' },
	      {:user_name_id => 1, :food_name => 'Swiss Cheese',
	      :expires_on => '12-Feb-2013', :qty => 1, :acquired_on => '1-Dec-2012', :price => 5.13, :food_type => 'Dairy' },
	      {:user_name_id => 1, :food_name => 'Roast Beef Slices',
	      :expires_on => '11-Feb-2013', :qty => 1, :acquired_on => '1-Jan-2013', :price => 4.13, :food_type => 'Meat, Fish, Beans, Eggs'},
	      {:user_name_id => 1, :food_name => '2% milk',
	      :expires_on => '11-Feb-2013', :qty => 1, :acquired_on => '1-Jan-2013', :price => 2.13, :unit => 'gallon', :food_type => 'Dairy'},
	      {:user_name_id => 1, :food_name => 'Raspberry Vinaigrette Salad dressing', :expires_on => '1-April-2013', :qty => 1, :acquired_on => '1-Jan-2013', :price => 2.13, :food_type => 'Fats, Oils, Sweets'},
	      {:user_name_id => 1, :food_name => 'Pad See Ew', :expires_on => '23-June-2013', :qty => 1, :acquired_on => '1-June-2013', :price => 12.13, :food_type => 'Leftovers'}
]

Food.send(:attr_accessible, :user_name_id, :food_name, :expires_on, :qty, :acquired_on, :price, :brand, :unit, :food_type)

initial_foods.each do |food|
  Food.create!(food)
end


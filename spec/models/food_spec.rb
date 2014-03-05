require 'spec_helper'

describe Food do

	before { @food = Food.new(food_name: "Hunky Dory", price: 5.00, qty: 2, expires_on: "2014-03-01", 
			acquired_on: "2014-02-21") }

	subject { @food }

	it {should respond_to(:food_name)}
	it {should respond_to(:qty)}
	it {should respond_to(:price)}
	it {should respond_to(:expires_on)}
	it {should respond_to(:acquired_on)}

	it { should be_valid }

	describe "when expiration date is earlier than acquired date" do
		before { @food.acquired_on = "2014-05-01" }

		it { should_not be_valid }

	end

	describe "when price < 0" do
		before { @food.price = -1.2 }
		it { should_not be_valid }
	end

	describe "when qty < 0" do 
		before { @food.qty = -5 }
		it { should_not be_valid }
	end
	


end

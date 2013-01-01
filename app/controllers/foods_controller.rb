class FoodsController < ApplicationController
  def index
    @foods = Food.all
  end


  def show
    id = params[:id]
    @food = Food.find(id)
  end

  def create
    @food = Food.create!(params[:food])
    flash[:notice] = "#{@food.food_name} was successfully created."
    redirect_to foods_path
    end

end

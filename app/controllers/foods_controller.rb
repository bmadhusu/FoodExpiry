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

  def edit
    @food = Food.find params[:id]
  end

  def update
    @food = Food.find params[:id]
    @food.update_attributes!(params[:food])
    flash[:notice] = "#{@food.food_name} was successfully updated."
    redirect_to food_path(@food)
  end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy
    flash[:notice] = "Food '#{@food.food_name}' deleted."
    redirect_to foods_path
  end
end

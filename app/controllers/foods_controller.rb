class FoodsController < ApplicationController
  def index
    @foods = Food.order("expires_on")

    @expired_price_tally = Food.where("expires_on < ?", Date.today).sum(:price)
    @price_tally = Food.sum("price") - @expired_price_tally

    respond_to do |format|
      format.html
      format.csv { render text: @foods.to_csv }
    end
#    raise x.inspect
  end

  def import_fresh_foods
    # delete all foods in fridge first
    # perhaps better to offer a separate clean fridge option

    csv_text = File.read('...')
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      Food.create!(row.to_hash)
    end

  end

  def show
    id = params[:id]
    @food = Food.find(id)
  end

#  def new
#    @food = Food.new
#  end

  def create
    @food = Food.new(params[:food])
    if @food.save
      flash[:notice] = "#{@food.food_name} was successfully created."
      redirect_to foods_path
    else
      render 'new'
    end
  end

  def edit
    @food = Food.find params[:id]
  end

  def update
    @food = Food.find params[:id]
    if @food.update_attributes(params[:food])
      flash[:notice] = "#{@food.food_name} was successfully updated."
      redirect_to food_path(@food)
    else
      render 'edit'
    end
  end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy
    flash[:notice] = "Food '#{@food.food_name}' deleted."
    redirect_to foods_path
  end
end

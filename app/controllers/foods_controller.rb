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

    # check if we should delete existing foods
    
    print params
    if params[:delete_foods]
      # delete all existing foods in table
      Food.destroy_all
    end

    uploaded = params[:file]

    csv = CSV.parse(uploaded.read, :headers => true)
    csv.each do |row|
      Food.create!(row.to_hash)
    end

    redirect_to foods_path

  end

  def destroy_multiple

    print params
    Food.destroy(params[:foods])

    respond_to do |format|
      format.html { redirect_to foods_path }
      format.json { head :no_content}
    end

  end

  def delete
    print params

    redirect_to foods_path

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

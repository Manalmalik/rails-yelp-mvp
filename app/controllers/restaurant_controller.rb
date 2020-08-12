class RestaurantController < ApplicationController

  #GET '/restaurant'
  def index
    @restaurants = Restaurant.all
  end

  #Get '/restaurant/:id'
  def show
    @restaurant = Restaurant.find(params[:id])
  end

  #GET '/restaurant/new'
  def new
    @restaurant = Restaurant.new
  end

  #Post '/restaurants'
  def create
    @restaurant = Restaurant.new(restaurant_params)

    if @restaurant.save
      redirect_to @restaurant, notice: 'Restaurant was successfully created.'
    else
      render :new
    end
  end

  #GET '/restaurant/:id/edit'
  def edit

  end

  private

  def restaurant_params
      params.require(:restaurant).permit(:name, :address, :stars)
  end

end

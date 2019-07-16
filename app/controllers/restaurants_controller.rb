class RestaurantsController < ApplicationController
  def new
    @restaurant = Restaurant.new
  end

  def show
    @restaurant = Restaurant.find_by(id: params[:id])
    if @restaurant.nil?
      redirect_to restaurants_path
    end
  end

  def index
  end

  def edit
  end

  def create
    @restaurant = Restaurant.create(restaurant_params)
    if @restaurant.valid?
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  def update

  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :phone, :address, :city, :state)
  end
end

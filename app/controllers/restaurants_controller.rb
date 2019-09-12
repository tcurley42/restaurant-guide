class RestaurantsController < ApplicationController
  before_action :require_login
  def new
    @restaurant = Restaurant.new
  end

  def show
    @restaurant = Restaurant.find_by(id: params[:id])
    redirect_if_nil
  end

  def index
    @restaurants = Restaurant.all
    respond_to do |format|
      format.html {render :index}
      format.json {render json: @restaurants, status: 200}
    end

  end

  def edit
    @restaurant = Restaurant.find_by(id: params[:id])
    redirect_if_nil
  end

  def create
    render json: Restaurant.create(restaurant_params), status: 201
  end

  def update
    @restaurant = Restaurant.find_by(id: params[:id])
    redirect_if_nil

    if @restaurant.update(restaurant_params)
      redirect_to restaurant_path(@restaurant)
    else
      render :edit
    end
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :phone, :address, :city, :state, :price)
  end

  def redirect_if_nil
    if @restaurant.nil?
      redirect_to restaurants_path
    end
  end
end

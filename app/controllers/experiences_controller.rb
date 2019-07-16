class ExperiencesController < ApplicationController
  def new
    @restaurant = Restaurant.find_by(id: params[:restaurant_id])
  end

  def edit
  end

  def index
  end

  def show
  end

  def create
    @experience = Experience.create(experience_params)

    redirect_to restaurant_path(@experience.restaurant)
  end

  def update

  end

  private

  def experience_params
    params.require(:experience).permit(:rating, :description, :user_id, :restaurant_id)
  end
end

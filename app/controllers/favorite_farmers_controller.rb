class FavoriteFarmersController < ApplicationController
  before_action :define_user_farmer, only: [:create, :destroy]

  def index
  end

  def create
    if FavoriteFarmer.create(user_id: @user.id, farmer_id: @farmer.id)
      redirect_to farmer_path(@farmer)
    else
      redirect_to root_path
    end
  end

  def destroy
    if favorite_farmer = FavoriteFarmer.find_by(user_id: @user.id, farmer_id: @farmer.id)
      favorite_farmer.destroy
      redirect_to farmer_path(@farmer)
    else
      redirect_to root_path
    end
  end

  private

  def define_user_farmer
    @farmer = Farmer.find(params[:user_id])
    @user = current_user
  end

end

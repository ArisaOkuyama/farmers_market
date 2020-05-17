class FavoriteFarmersController < ApplicationController
  def index

    
  end

  def create
    @user = current_user
    @farmer = Farmer.find(params[:user_id])
    if FavoriteFarmer.create(user_id: @user.id, farmer_id: @farmer.id)
      redirect_to farmer_path(@farmer)
    else
      redirect_to root_path
    end
  end

  def destroy
    @user = current_user
    @farmer = Farmer.find(params[:user_id])
    if favorite_farmer = FavoriteFarmer.find_by(user_id: @user.id, farmer_id: @farmer.id)
      favorite_farmer.destroy
      redirect_to farmer_path(@farmer)
    else
      redirect_to root_url
    end
  end
end

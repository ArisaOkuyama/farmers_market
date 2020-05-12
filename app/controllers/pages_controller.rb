class PagesController < ApplicationController
  def index
    @products = Product.all
  end
  def qanda
  end
  def contactus 
  end
  def profile
  end

  def login
     
  end

  def create
    if params[:key] == "farmer"
      current_user.add_role(:admin)
      redirect_to root_path , notice: 'You have logged in as a farmer.' 
    else
      redirect_to root_path, notice: 'Wrong passcode for farmer.' 
    end
  end

  private

  def add_role
    if params[:key] == "farmer"
      current_user.add_role (:farmer)
      
    else
      redirect_to root_path
    end 
  end

end

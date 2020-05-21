class PagesController < ApplicationController

  def index
    @products = Product.all
    @categories = Category.all
  end

  def qanda
  end

  def contactus 
  end

  def profile
    @favorite_farmers = current_user.favorite_farmers
  end

  def admin
    # only admin can access this page
    if !current_user.has_role?(:admin)
      redirect_to root_path, notice: 'You are not authorised for this action.'
    end
    @categories = Category.all
  end

end

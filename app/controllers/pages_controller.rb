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

end

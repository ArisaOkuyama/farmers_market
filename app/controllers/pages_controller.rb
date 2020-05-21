class PagesController < ApplicationController

  def index
    # it shows the 8 newest products in top page when render '_index' from product view
    @products = Product.all.order(created_at: :desc).first(8)
    @categories = Category.all
  end

  def qanda
  end

  def aboutus
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

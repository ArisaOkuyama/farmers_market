class PagesController < ApplicationController
  def index
    @products = Product.all
  end
  def qanda
  end
  def contactus
    
  end
end

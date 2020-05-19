class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def create
    @category = Category.new(category_params)
    respond_to do |format|
      if @category.save
        format.html { redirect_to root_path, notice: 'category was successfully created.' }
      else
        redirect_to root_path,  notice: :unprocessable_entity
      end
    end
  end

  private

  def category_params
    params.permit(:name)
  end
end

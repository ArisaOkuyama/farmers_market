class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :delete]
  before_action :search_category_state, only: [:index]
  before_action :matched_farmer, only: [:edit, :delete]
  before_action :is_farmer, only: [:new]


  def index
    #sorting by newest or cheapest from all products
    @products = @products.order(created_at: :desc) if params[:new].present?
    @products = @products.order(:price) if params[:order].present?
    
    @products = @products.page(params[:page]).per(8)
  end

  def show
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def create
    @product = Product.new(product_params)
    @product.category_id = params[:product][:category_id]
    @product.farmer = current_user.farmer
    @product.picture.attach(params[:product][:picture])
    @product.state = current_user.farmer.state
    respond_to do |format|
      if @product.save
        format.html { redirect_to product_path(@product), notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to product_path(@product), notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:name, :description, :price, :state, :stock, :picture, :order, :new)
    end

    #Searching by only category or both category and state or only state
    def search_category_state
      if params[:search][:category_id].present?
        @products = Product.search(params[:search][:category_id])
        if params[:state].present?
          @products = @products.search(params[:state])
        end
      elsif params[:state].present?
        @products = Product.search(params[:state])
      else
        @products = Product.all
      end
    end

    # checks if farmer_id matches to product and user is a farmer
    def matched_farmer
      if !current_user.farmer or !(current_user.farmer.id == @product.farmer.id)
        redirect_to root_path, notice: 'You are not authorised for this action.'
      end
    end
    # check if user is farmer to create a product
    def is_farmer
      if !current_user.farmer
        redirect_to root_path, notice: 'You are not authorised for this action.'
      end
    end
end 

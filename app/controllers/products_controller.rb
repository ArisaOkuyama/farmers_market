class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  def index
    @products = Product.all.page(params[:page]).per(8)
      if params[:search][:category_id].present?
        @products = Product.search(params[:search][:category_id]).page(params[:page]).per(8)
        @products = @products.search(params[:state]).page(params[:page]).per(3) if params[:state].present?
      else
        @products = Product.all.page(params[:page]).per(8)
        @products = @products.search(params[:state]).page(params[:page]).per(3) if params[:state].present?
      end
  end

  # GET /products/1
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  def create
    @product = Product.new(product_params)
    @product.category_id = params[:product][:category_id]
    @product.farmer = current_user.farmer
    @product.picture.attach(params[:product][:picture])
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

  # PATCH/PUT /products/1
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

  # DELETE /products/1
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
      params.require(:product).permit(:name, :description, :price, :state, :stock, :picture)
    end
end

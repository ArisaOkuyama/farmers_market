class FarmersController < ApplicationController
  before_action :set_farmer, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :delete]

  
  # GET /farmers
  # GET /farmers.json
  def index
    @farmers = Farmer.all
  end

  
  # GET /farmers/1
  # GET /farmers/1.json
  def show
    @farmer = Farmer.find(params[:id])
    @reviews = @farmer.reviews
    @products = @farmer.products
    @favorited_users = @farmer.favorite_farmers
  end

  # GET /farmers/new
  def new
    @farmer = Farmer.new
    if current_user.farmer 
      redirect_to root_path , notice: 'You already have registered as a farmer.' 
    end
  end

  # GET /farmers/1/edit
  def edit
  end

  # POST /farmers
  # POST /farmers.json
  def create
    @farmer = Farmer.new(farmer_params)
    @user = current_user
    @farmer.user = @user
    @farmer.farmers_picture.attach(params[:farmer][:farmers_picture])

    respond_to do |format|
      if @farmer.save
        current_user.add_role (:farmer)
        format.html { redirect_to farmers_path, notice: 'Farmer was successfully created.' }
        format.json { render :show, status: :created, location: @farmer }
      else
        format.html { render :new }
        format.json { render json: @farmer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /farmers/1
  # PATCH/PUT /farmers/1.json
  def update
    respond_to do |format|
      if @farmer.update(farmer_params)
        format.html { redirect_to @farmer, notice: 'Farmer was successfully updated.' }
        format.json { render :show, status: :ok, location: @farmer }
      else
        format.html { render :edit }
        format.json { render json: @farmer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /farmers/1
  # DELETE /farmers/1.json
  def destroy
    @farmer.destroy
    respond_to do |format|
      format.html { redirect_to farmers_path, notice: 'Farmer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_farmer
      @farmer = Farmer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def farmer_params
      params.require(:farmer).permit(:farm_name, :first_name, :last_name, :state, :address,:farmers_picture)
    end
end

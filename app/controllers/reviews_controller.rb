class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  # GET /reviews
  # GET /reviews.json
  def index
    @reviews = Review.all
  end

  # GET /reviews/1
  # GET /reviews/1.json
  def show
    @reviews = Review.find(params[:review_id])
  end

  # GET /reviews/new
  def new
    @farmer = Farmer.find(params[:farmer_id])
    @review = Review.new
  end

  # GET /reviews/1/edit
  def edit
  end
  
  # POST /reviews
  # POST /reviews.json
  def create
    @farmer = Farmer.find(params[:farmer_id])
    @review = Review.new(review_params)
    @review.user = current_user
    @review.farmer = @farmer
    if @review.save
      redirect_to farmer_path(@farmer.id), notice: 'Review was successfully created.' 
    else
      redirect_to root_path, notice: "Coundnot save your reveiwe"
    end
    
  end

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to @review, notice: 'Review was successfully updated.' }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @farmer = Farmer.find(params[:farmer_id])
    @review.destroy
    respond_to do |format|
      format.html { redirect_to farmer_path(@farmer.id) , notice: 'Review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def review_params
      params.require(:review).permit(:comment, :rating)
    end
end

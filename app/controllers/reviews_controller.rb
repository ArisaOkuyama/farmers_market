class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :delete]
  before_action :farmer_cant_review, only: [:new, :edit, :delete]

  def index
    @reviews = Review.all
  end

  def show
    @reviews = Review.find(params[:review_id])
  end

  def new
    @farmer = Farmer.find(params[:farmer_id])
    @review = Review.new
  end

  def edit
  end
  
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
    # only user allow to write a review for farmer
    def farmer_cant_review
      if current_user.farmer
        redirect_to root_path, notice: 'You are not authorised for this action.'
      end
    end
end

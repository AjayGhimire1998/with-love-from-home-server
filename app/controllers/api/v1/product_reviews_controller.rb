class Api::V1::ProductReviewsController < ApplicationController
  before_action :set_product_review, only: [:show, :update, :destroy]

  # GET /product_reviews
  def index
    @product_reviews = ProductReview.all

    render json: @product_reviews
  end

  # GET /product_reviews/1
  def show
    render json: @product_review
  end

  def product_reviews 
    store_reviews = Product.find_by(id: params[:id]).product_reviews
    # customers = User.find
    render json: store_reviews
  end

  # POST /product_reviews
  def create
    @product_review = ProductReview.new(product_review_params)

    if @product_review.save
      render json: @product_review, status: :created
    else
      render json: @product_review.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /product_reviews/1
  def update
    if @product_review.update(product_review_params)
      render json: @product_review
    else
      render json: @product_review.errors, status: :unprocessable_entity
    end
  end

  # DELETE /product_reviews/1
  def destroy
    @product_review.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_review
      @product_review = ProductReview.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_review_params
      params.require(:product_review).permit(:content, :product_id, :user_id, :rating)
    end
end

class Api::V1::ProductsController < ApplicationController
  # before_action :user_authorized, except: [:create]
  before_action :store_authorized, except: [:index, :show, :store_products]
  
  before_action :set_product, only: [:show, :update, :destroy]

  # GET /products
  def index
    # byebug
      @products = Product.all
      render json: {products: @products}
  end

  # GET /products/1
  def show
    render json: @product
  end

  def store_products 
    store_products = Store.find_by(id: params[:id]).products
    render json: store_products
  end

  # POST /products
  def create
      @product = Product.new(product_params)

      if @product.save
        render json: {last_product: @product}, status: :created
      else
        render json: @product.errors, status: :unprocessable_entity
      end
  end

  # PATCH/PUT /products/1
  def update
    if @product.update(product_params)
      render json: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # DELETE /products/1
  def destroy
    @product.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:name, :price, :store_id, :description, :available, :in_stock, images: [])
    end
end

class Api::V1::CartItemsController < ApplicationController
  before_action :set_cart_item, only: [:show, :update, :destroy]
  before_action :user_authorized, only: [:create]
  before_action :store_authorized, only: [:update, :destroy]

  # GET /cart_items
  def index
    @cart_items = CartItem.all

    render json: @cart_items
  end

  # GET /cart_items/1
  def show
    render json: @cart_item
  end

  def email_cart_item_status_to_user
    item = CartItem.find_by(id: params[:id].to_i)
    if item 
      cart = item.cart
      store = cart.store
    end
    UserMailer.user_order_status(store, item, cart).deliver_now
  end

  # POST /cart_items
  def create
    @cart_item = CartItem.new(cart_item_params)
    # byebug
    if @cart_item.product.in_stock >= @cart_item.amount && @cart_item.save
      @cart_item_product = @cart_item.product
      @cart_item_product.in_stock = @cart_item_product.in_stock - @cart_item.amount
      @cart_item_product.save
      render json: @cart_item, status: :created
    else
      render json: @cart_item.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /cart_items/1
  def update
    if @cart_item.update(cart_item_params)
      render json: @cart_item
    else
      render json: @cart_item.errors, status: :unprocessable_entity
    end
  end

  # DELETE /cart_items/1
  def destroy
    @cart_item.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart_item
      @cart_item = CartItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cart_item_params
      params.require(:cart_item).permit(:product_id, :cart_id, :amount, :total, :status, :reject_message, approve_message: {})
    end
end

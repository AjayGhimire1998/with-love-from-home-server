class Api::V1::CartsController < ApplicationController
  before_action :set_cart, only: [:show, :update, :destroy]
  before_action :user_authorized, only: [:create]

  # GET /carts
  def index
    @carts = Cart.all

    render json: @carts
  end

  # GET /carts/1
  def show
    render json: @cart
  end

  def store_carts 
    carts = Store.find_by(id: params[:id]).carts
    cart_items = []
    carts.each{|cart| cart_items << cart.cart_items}
    render json: {carts: carts, cart_items: cart_items }
  end

  # POST /carts
  def create
    @cart = Cart.new(cart_params)

    if @cart.save
      render json: @cart, status: :created
    else
      render json: @cart.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /carts/1
  def update
    if @cart.update(cart_params)
      render json: @cart
    else
      render json: @cart.errors, status: :unprocessable_entity
    end
  end

  # DELETE /carts/1
  def destroy
    @cart.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      @cart = Cart.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cart_params
      params.require(:cart).permit(:user_id, :store_id, :customer_name, :delivery_address, :phone_number, :recipient_email)
    end
end

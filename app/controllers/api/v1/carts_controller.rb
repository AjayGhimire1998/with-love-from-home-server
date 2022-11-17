class Api::V1::CartsController < ApplicationController
  before_action :set_cart, only: [:show, :update, :destroy]
  before_action :user_authorized, only: [:create]
  # before_action :store_authorized, only: [:store_carts]

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

  def user_carts 
    carts = User.find_by(id: params[:id]).carts
    cart_items = []
    carts.each{|cart| cart_items << cart.cart_items}
    render json: {carts: carts, cart_items: cart_items}
  end

  def email_cart_to_user_and_store 
    cart = Cart.find_by(id: params[:id].to_i)
    if cart
      store = cart.store
      items = cart.cart_items
    end
    UserMailer.user_order_placed(store, items, cart).deliver_now
    StoreMailer.store_order_received(store, items, cart).deliver_now
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
      params.require(:cart).permit(:user_id, :store_id, :customer_name, :phone_number, :recipient_email, delivery_address: {} )
    end
end

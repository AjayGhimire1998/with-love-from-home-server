class Api::V1::StoresController < ApplicationController
  before_action :set_store, only: [:show, :update, :destroy]
  before_action :store_authorized, only: [ :update, :destroy]

  # GET /stores
  def index
    @stores = Store.all
    render json: @stores
  end

  # GET /stores/1
  def show
    @category_name = Category.find_by(id: @store.category_id).name
    render json: {store: {current_store: @store, category_name: @category_name}}
  end

  # POST /stores
  def create
    # raise params.inspect
    @store = Store.create(store_params)
    # @store.avatar.attach(io: File.open(`#{params[:avatar]}`), filename: 'file.pdf')
      if @store.valid?
          @token = encode_token(store_id: @store.id)
          render json: { store: StoreSerializer.new(@store), accessToken: @token }, status: :created
      else
          render json: { error: @store.errors.full_messages }, status: :not_acceptable
      end
  end

  # PATCH/PUT /stores/1
  def update
    if @store.update(store_params)
      render json: {store: {current_store: @store, category_name: @category_name}}
    else
      render json: {error: @store.errors.full_messages}, status: :unprocessable_entity
    end
  end

  # DELETE /stores/1
  def destroy
    @store.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_store
      @store = Store.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def store_params
      params.require(:store).permit(:name, :category_id, :email, :password, :password_confirmation, :logo )
    end
end

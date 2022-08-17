class Api::V1::SessionsController < ApplicationController
  def create
    @user = User.where(email: params[:email]).first 

    if @user&.authenticate(params[:password])
      # if @user.has_attribute?(:fullname)
        token = encode_token(user_id: @user.id)
        render json: {user: UserSerializer.new(@user), accessToken: token}, status: :created
      # else
      #   token = encode_token(store_id: @user.id)
      #   render json: {store: StoreSerializer.new(@user), jwt: token}, status: :created
      # end
    else
      render json: {error: "Invalid Credentials"}, status: :unauthorized
    end
  end

end

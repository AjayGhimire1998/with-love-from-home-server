class Api::V1::SessionsController < ApplicationController
  skip_before_action :authorized, only: [:create]
  def create
    @user = User.where(email: params[:email]).first

    if @user&.valid_password?(params[:password])
      token = encode_token(user_id: @user.id)
      render json: {user: UserSerializer.new(@user), jwt: token}, status: :created
    else
      render json: {error: 'Invalid Credentials'}, status: :unauthorized
    end
  end

  def destroy

  end
end

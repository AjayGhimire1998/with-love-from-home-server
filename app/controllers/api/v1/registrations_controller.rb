class Api::V1::RegistrationsController < ApplicationController
  def create
    @user = User.create(user_params)
    if @user.valid?
      @token = encode_token(user_id: @user.id)
      render json: { user: UserSerializer.new(@user), accessToken: @token }, status: :created
    else
      render json: { error: @user.errors.full_messages }, status: :not_acceptable
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :fullname)
  end
end

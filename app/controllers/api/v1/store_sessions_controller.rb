class Api::V1::StoreSessionsController < ApplicationController 
    def create
        @store = Store.where(email: params[:email]).first 
        if @store&.authenticate(params[:password])
            token = encode_token(store_id: @store.id)
            render json: { store: StoreSerializer.new(@store), accessToken: token }, status: :created
        else
            render json: { error: "Invalid Credentials" }, status: :unauthorized
        end
    end
end
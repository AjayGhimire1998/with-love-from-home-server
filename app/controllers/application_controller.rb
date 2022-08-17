class ApplicationController < ActionController::API
    
    # before_action :authorized

    SECRET_KEY = Rails.application.secrets.secret_key_base.to_s

    def encode_token(payload)
      # should store secret in env variable
      JWT.encode(payload, SECRET_KEY)
    end
  
    def auth_header
      # { Authorization: 'Bearer ' }
      request.headers['Authorization']
    end
  
    def decoded_token
      if auth_header
        token = auth_header.split(' ')[1]
        # header: { 'Authorization': 'Bearer ' }
        begin
          JWT.decode(token , SECRET_KEY, true, algorithm: 'HS256')
        rescue JWT::DecodeError
          nil
        end
      end
    end
  
    def current_user
      if decoded_token
        user_id = decoded_token[0]['user_id']
        @user = User.find_by(id: user_id)
      end
    end

    def current_store 
      if decoded_token 
        store_id = decoded_token[0]["store_id"]
        @store = Store.find_by(id: store_id)
      end
    end
  
    def user_logged_in?
      !!current_user
    end

    def store_logged_in?
      !!current_store
    end

    def store_authorized 
      render json: { message: 'Please log in with you store credentials' }, status: :unauthorized unless store_logged_in?
    end
  
    def user_authorized
      render json: { message: 'Please log in' }, status: :unauthorized unless user_logged_in?
    end

end

class Api::V1::PasswordsController < ApplicationController 
    def forgot_user_password
        user = User.find_by(email: params[:_json])
        if user
          user.send_user_password_reset
          render json: {
            alert: "We have sent you a password reset email. Please check spam if not found in inbox."
          }
          
        else
          #this sends regardless of whether there's an email in database for security reasons
          render json: {
            alert: "Could not find user with that email address."
          }
        end
      end
    
      def reset_user_password
        user = User.find_by(password_reset_token: params[:token], email: params[:email])
        if user.present? && user.password_token_valid?
          if user.reset_password(params[:password])
            render json: {
              alert: "Your password has been successfuly reset!"
            }
            # session[:user_id] = user.id
          else
            render json: { error: user.errors.full_messages }, status: :unprocessable_entity
          end
        else
          render json: {error:  ['Link not valid or expired. Try generating a new link.']}, status: :not_found
        end
      end

      def forgot_store_password
        store = Store.find_by(email: params[:_json])
        if store
          store.send_store_password_reset
          render json: {
            alert: "We have sent you a password reset email. Please check spam if not found in inbox."
          }
          
        else
          #this sends regardless of whether there's an email in database for security reasons
          render json: {
            alert: "Could not find store with that email address."
          }
        end
      end
    
      def reset_store_password
        store = Store.find_by(password_reset_token: params[:token], email: params[:email])
        if store.present? && store.password_token_valid?
          if store.reset_password(params[:password])
            render json: {
              alert: "Your password has been successfuly reset!"
            }
            # session[:user_id] = store.id
          else
            render json: { error: store.errors.full_messages }, status: :unprocessable_entity
          end
        else
          render json: {error:  ['Link not valid or expired. Try generating a new link.']}, status: :not_found
        end
      end
end
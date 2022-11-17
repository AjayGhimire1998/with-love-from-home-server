Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :products
      resources :categories, only: [:index, :show]
      resource :sessions, only: [:create]
      resources :registrations, only: [:create]
      resources :stores
      resource :store_sessions, only: [:create]
      resources :reviews
      resources :product_reviews
      resources :carts
      resources :cart_items
      resources :users, only: [:index]
    end
  end
  get 'api/v1/stores/:id/products', to: 'api/v1/products#store_products'
  get 'api/v1/stores/:id/reviews', to: 'api/v1/reviews#store_reviews'
  get 'api/v1/products/:id/reviews', to: 'api/v1/product_reviews#product_reviews'
  get 'api/v1/stores/:id/orders', to: 'api/v1/carts#store_carts'
  get 'api/v1/users/:id/orders', to: 'api/v1/carts#user_carts'
  post 'api/v1/passwords/forgot_user_password', to: 'api/v1/passwords#forgot_user_password'
  post 'api/v1/passwords/reset_user_password', to: 'api/v1/passwords#reset_user_password'
  post 'api/v1/passwords/forgot_store_password', to: 'api/v1/passwords#forgot_store_password'
  post 'api/v1/passwords/reset_store_password', to: 'api/v1/passwords#reset_store_password'
  post 'api/v1/orders/:id/mail_to_user_and_store', to: 'api/v1/carts#email_cart_to_user_and_store'
  post 'api/v1/order/:id/mail_to_user', to: 'api/v1/cart_items#email_cart_item_status_to_user'
  # get 'api/v1/orders/:id/order_items', to: 'api/v1/cart_items#cart_items'
  # resources :users
  # resources :stores
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

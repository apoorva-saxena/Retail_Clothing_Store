Rails.application.routes.draw do
  # resources :products
  get '/products' => 'products#index'
  get '/carts' => 'carts#index'
  get '/carts/:id' => 'carts#create'
  get '/clear_session' => 'carts#clear_session'
  get '/delete/:id' => 'carts#destroy'
  post '/voucher' => 'cart#voucher_params'

end

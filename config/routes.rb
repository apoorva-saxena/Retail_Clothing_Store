Rails.application.routes.draw do
  # resources :products
  get '/' => redirect('/products')
  get '/products' => 'products#index'
  get '/carts' => 'carts#index'
  get '/carts/:id' => 'carts#create'
  get '/clear_session' => 'carts#clear_session'
  get '/remove_from_session/:id' => 'carts#destroy_from_session'
  get '/voucher' => 'vouchers#index'
  post '/voucher/apply' => 'vouchers#apply_voucher_discount'
end

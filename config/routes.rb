Rails.application.routes.draw do
  resources :products
  get '/carts' => 'carts#index'
  get '/carts/:id' => 'carts#create'
  get '/clear_session' => 'carts#clear_session'
  get '/delete/:id' => 'carts#destroy'
end

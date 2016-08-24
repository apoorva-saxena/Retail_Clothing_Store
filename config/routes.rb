Rails.application.routes.draw do
  resources :products
  get '/carts' => 'carts#index'
  get '/carts/:id' => 'carts#create'
  get '/carts/delete' => 'carts#destroy'
end

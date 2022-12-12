Rails.application.routes.draw do
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'home/index'
  root "home#index"

  get "/products", to: "products#index", as: "products"
  get "/products/:id", to: "products#show", as: "product", constraints: {id: /\d+/}
  get "search", to:"products#search"

  get "/categories", to: "categories#index", as: "categories"
  get "/categories/:id", to: "categories#show", as: "category", constraints: {id: /\d+/}

  get "/about", to: "about#index", as: "about"
  get "/contact", to: "contact#index", as: "contact"

  get "/account", to: "accounts#index", as: "account"
  get "/new_address", to: "accounts#new_address", as: "new_address"
  post "accounts/add_address/", to: "accounts#add_address", as: "add_address"
  post "accounts//", to: "accounts#delete_address", as: "delete_address"

  post 'products/add_to_cart/:id', to: 'products#add_to_cart', as: 'add_to_cart'
  delete 'products/remove_from_cart/:id', to: 'products#remove_from_cart', as: 'remove_from_cart'
  post 'products/update_cart/:id', to: 'products#update_cart', as: 'update_cart'
  post 'products/buy', to: 'products#buy', as: 'buy'

  get "/cart", to: "products#cart", as: "cart"
end

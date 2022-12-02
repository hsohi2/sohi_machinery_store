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
end

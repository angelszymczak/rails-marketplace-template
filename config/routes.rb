Rails.application.routes.draw do
  resources :categories, except: %I[show]
  resources :products

  root 'products#index'

  if Rails.env.development?
    mount Lookbook::Engine, at: "/lookbook"
  end
end

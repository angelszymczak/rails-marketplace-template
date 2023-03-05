Rails.application.routes.draw do
  resources :categories, except: %I[show]
  resources :products

  root 'products#index'
end

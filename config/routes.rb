Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :recipes
  resources :ingredients

  root to: 'pages#landing_page'
  # root to: 'recipes#index'
end

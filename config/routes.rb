Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :recipes do
    collection do
      get :search
    end
  end
  resources :ingredients

  root to: 'pages#landing_page'
end

Rails.application.routes.draw do
  # API definition
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users, only: %i[show create update destroy]
      resources :tokens, only: [ :create ]
      resources :products
      resources :orders, only: [ :index ]
    end
  end

  # get "up" => "rails/health#show", as: :rails_health_check
end

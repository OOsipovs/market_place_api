Rails.application.routes.draw do
  # API definition
  namespace :api, defaults: { format: :json } do
  end

  # get "up" => "rails/health#show", as: :rails_health_check
end

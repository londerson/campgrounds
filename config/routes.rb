Rails.application.routes.draw do
  devise_for :users
  get "up" => "rails/health#show", as: :rails_health_check

  root "campgrounds#index"

  resources :campgrounds, only: [:index, :show] do
    collection do
      get 'recently_viewed'
    end
  end

  namespace :api do
    namespace :v1 do
      resources :users, only: [] do
        get 'recently_viewed'
      end
    end
  end
end

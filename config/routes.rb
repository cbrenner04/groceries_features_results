Rails.application.routes.draw do
  devise_for :users

  namespace :api, defaults: { format: :json } do
    as :user do
      post   "/sign-in"  => "sessions#create"
      delete "/sign-out" => "sessions#destroy"
    end
    resources :features, only: :create
    resources :results, only: :create
  end

  resource :home, only: :show
  resources :features, only: :index do
    resources :results, only: :index
  end
  resources :test_runs, only: %i[index show]
  root to: 'home#show'
end

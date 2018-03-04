Rails.application.routes.draw do
  devise_for :users
  resource :home, only: :show
  root to: 'home#show'
end

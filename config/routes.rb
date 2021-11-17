Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  devise_for :users

  resources :users, shallow: true do
    resource :profile, only: %w[edit update show]
    resources :acknowledgments, only: %w[new]
    resources :accounts
    resources :images
  end

  namespace :api do
    post 'images_uploads', to: 'images_uploads#create'
    get 'images_uploads/:blob_id', to: 'images_uploads#show'
  end
end

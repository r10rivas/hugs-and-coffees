Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  devise_for :users

  resources :users, shallow: true do
    resources :accounts
    resources :acknowledgments, only: %w[new] do
      get 'thanks', on: :collection
    end
    resources :coffees, only: %w[new create]
    resources :hugs, only: %w[new create] do
      get 'set_duration', on: :collection
    end
    resources :images
    resource :profile, only: %w[edit update show]  do
      post 'update_status', on: :member
    end
  end

  namespace :api do
    post 'images_uploads', to: 'images_uploads#create'
    get 'images_uploads/:blob_id', to: 'images_uploads#show'
    resources :accounts, only: %w[show]
  end
end

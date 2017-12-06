Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users, only: [ :update, :create ]
      resources :items, only: [ :index, :show, :update, :create, :destroy ] do
        resources :comments, only: [:index, :create]
      end
      resources :likes, only: [] do
        collection do
        post :like
        post :unlike
        end
      end
    end
  end
end

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_for :users
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  root "users#index"
  resources :users do
    resources :posts, only: [ :show, :index, :new, :create, :destroy ] do
      resources :comments, only: [ :create ]
      resources :likes, only: [ :create, :destroy ]
    end
  end
  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  namespace :api do
    namespace :v1 do
      resources :users, only: [] do
        resources :posts, only: [ :index ], controller: "user_posts" do
          resources :comments, only: [ :index, :create ], controller: "post_comments"
        end
      end
    end
  end
end

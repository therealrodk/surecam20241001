Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :comments, except: [:edit, :index, :show]
  resources :posts, except: [:index]
  resources :static, only: [:index]
  # resources :todos, only: [:index]
  get "all_todos", to: "todos#index", as: :all_todos
  post "create_todo", to: "todos#create", as: :create_todo
  get "new_todo", to: "todos#new", as: :new_todo
  delete "remove_todo/:id", to: "todos#destroy", as: :remove_todo
  devise_for :users

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  root "static#index"
end

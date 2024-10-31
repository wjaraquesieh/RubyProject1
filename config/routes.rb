Rails.application.routes.draw do
  get "about/index"
  get "category/index"
  get "category/show"
  get "brand/index"
  get "brand/show"
  get "product/index"
  get "product/show"
  get "home/index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"

  root "home#index"
  get "products", to: "product#index"
  get "product/:id", to: "product#show", as: "product"
  get "search", to: "product#search"
  get "brands", to: "brand#index"
  get "brand/:id", to: "brand#show", as: "brand"
  get "categories", to: "category#index"
  get "category/:id", to: "category#show", as: "category"
  get "about", to: "about#index"

  resources :product_type, only: [ :index ]
end

Rails.application.routes.draw do
  resources :galery_photos
  resources :galeries
  devise_for :users
  resources :giras do
    member do
      post 'add_presence'
    end
  end

  resources :galeries

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  get 'search' => "giras#search", as: :search
  get 'about_us', to: "giras#about_us", as: :about_us
  get 'locations', to: "giras#locations", as: :locations
  get 'contacts', to: "giras#contacts", as: :contacts

  post 'change_device' => "giras#change_device", as: :change_device


  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  root "giras#index"
end

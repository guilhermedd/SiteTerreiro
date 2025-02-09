Rails.application.routes.draw do
  devise_for :users
  resources :galeries do
    member do
      delete 'detach_image'
    end
  end

  resources :giras do
    member do
      post 'add_presence'
    end
  end

  # Outras rotas (sem duplicação de resources :galeries)
  get "up" => "rails/health#show", as: :rails_health_check
  get 'search' => "giras#search", as: :search
  get 'about_us', to: "giras#about_us", as: :about_us
  get 'locations', to: "giras#locations", as: :locations
  get 'contacts', to: "giras#contacts", as: :contacts
  post 'change_device' => "giras#change_device", as: :change_device
  get 'galery_photos/form', to: 'galery_photos#form'

  # config/routes.rb

  root "giras#index"
end

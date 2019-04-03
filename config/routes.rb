Rails.application.routes.draw do
  devise_for :users

  post '/rate', to: 'rater#create', as: :rate
  get 'my_tours', to: 'users#my_tours', as: :my_tours

  resources :tours do
    member do
      get :booking
    end
  end

  post 'booking/:id', to: 'users#booking', as: :create_booking

  root to: "home#index"
end

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :movies
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'pages#home'
  get 'about', to:'pages#about'

  resources :articles

  get 'signup', to:'users#new'
  resources :users, except: [:new]

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

end

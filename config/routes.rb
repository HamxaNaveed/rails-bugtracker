Rails.application.routes.draw do
  resources :projects do
    resources :fixes do
      member do
        put :assign, :complete
      end
    end
  end
  
  devise_for :users, controllers: { registrations: 'users/registrations' }


  devise_scope :user do  
    get '/users/sign_out' => 'devise/sessions#destroy'     
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#home"
  get '/profile', to: 'pages#profile'
end

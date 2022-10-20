Rails.application.routes.draw do
  resources :projects do
    resources :fixes do
      member do
        put :assign, :complete
      end
    end
  end
  
  resources :dashboards, only: [:index]

  devise_for :users, controllers: { registrations: 'users/registrations' }


  devise_scope :user do  
    get '/users/sign_out' => 'devise/sessions#destroy'   
    authenticated :user do
      root 'pages#dashboard', as: :authenticated_root
    end  
  end

   
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#home"
end

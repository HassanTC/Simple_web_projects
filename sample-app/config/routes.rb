Rails.application.routes.draw do
  root             				'static_pages#home'
  get 	 'help'     	 => 'static_pages#help'
  get 	 'home'	    	 => 'static_pages#home'
  get 	 'about'	   	 => 'static_pages#about'
  get 	 'contact'	 	 => 'static_pages#contact'
  get 	 'signup'  		 => 'users#new'
  get    'login'  		 => 'sessions#new'
  post   'login'   		 => 'sessions#create'
  delete 'logout' 		 => 'sessions#destroy'
  resources :microposts,          only: [:create, :destroy]
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :relationships,       only: [:create, :destroy]
end

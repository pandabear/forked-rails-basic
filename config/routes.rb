Library::Application.routes.draw do

  resources :books do
    collection do
      get :search
    end
    resources :reservations, only: [:create, :new] do
      member do
        put :free
      end
    end
    
    member do
      post "rate" => "ratings#rate"
    end
  end
  
  match "facebook" => "facebook#index"
  
  match "facebook/login" => "facebook#login"
  
  match "facebook/logout" => "facebook#logout"
  
  match "facebook/callback" => "facebook#callback"
  
  root :to => 'books#index'

end

Library::Application.routes.draw do

  resources :books do
    collection do
      get :search
    end
    resources :reservations, :only => [:create] do
      member do
        put :free
      end
    end
    resources :ratings, :only => [:create]
    resources :comments, :only => [:create]
  end
  
  match 'site/isbn' => 'site#isbn', :via => [:get, :post], :as => :isbn_validator

  root :to => 'books#index'
  
end

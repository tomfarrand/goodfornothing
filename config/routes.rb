Goodfornothing::Application.routes.draw do
	
  ActiveAdmin.routes(self)
  
  match "markdown_preview" => "application#markdown_preview"
  
  devise_for :users, :controllers => { :registrations => :registrations, :sessions => :sessions } 
  match "members" => "members#index"
  match "members/:id" => "members#show", :as => "member"

  devise_scope :user do
    
    # Rename default devise scopes
    get "/login" => "devise/sessions#new"
    delete "/logout" => "devise/sessions#destroy"
    get "/register" => "registrations#new"
    
    # Ning user activation routes
    get "/reactivate" => "registrations#reactivate", :as => "reactivate"
    post "/reactivate" => "registrations#send_reactivation", :as => "reactivate"
    get "/claim/:reset_password_token" => "registrations#claim", :as => "claim"
    put "/claim/" => "registrations#activate", :as => "activate"
    
    # Profile editing
    get '/users/edit/activity' => 'registrations#edit_activity', :as => "activity"
    get '/users/edit/talents' => 'registrations#edit_talents', :as => "talents"
    get '/users/tell-us-more' => 'registrations#edit_moar', :as => "moar"
    
    put '/users/edit/activity' => 'registrations#update_activity', :as => "activity"
    put '/users/edit/talents' => 'registrations#update_talents', :as => "talents"
    
  end
  
  resources :warblings, :only => [:index, :show]
  resources :posts, :only => [:show, :index]

  match "library" => "bookmarks#index"
  match "library/search" => "bookmarks#search"
  match "library/:id" => "bookmarks#index", :as => "bookmark_tag"

  resources :challenges, :only => [:show, :index, :new, :create] do
    collection do
      match "warbling/:id" => "challenges#index", :as => "warbling"
      match "thanks" => "challenges#thanks", :as => "thanks"
    end
    resources :ideas
    resources :contributions
  end

	resources :gigs, :only => [:show, :index] do
	  collection do 
	    match "chapter/:id" => "gigs#index", :as => "chapter"
	  end
	  member do 
	    get "attend"
	  end
	end
	
	resources :socials, :only => [:show] do
	  member do 
	    get "attend"
	  end
	end
	
  resources :partners, :only => [:index,:new, :create] do
    collection do
      match "thanks" => "partners#thanks", :as => "thanks"
    end
  end
  
  resources :friends, :only => [:index]
  resources :ventures, :only => [:index]
  
  match "how-it-works" => "colophon#how", :as => "how"
	match "who" => "colophon#who"
	match "community" => "colophon#community"
  match "calendar" => "colophon#calendar"
  match "privacy" => "colophon#privacy"

	root :to => "home#index"

end
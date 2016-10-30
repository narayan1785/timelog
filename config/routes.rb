Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'sessions#index'
   get "log_out" => "sessions#destroy", :as => "log_out"
   get "sign_up" => "users#new", :as => "sign_up"
   resources :users do
   	get :autocomplete_user_username, :on => :collection
   end
   resources :sessions
   resources :dashboards do
   	 get :arrival_stats, on: :collection
   end
  
end

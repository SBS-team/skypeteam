Skypeteam::Application.routes.draw do
  root :to => "home#index"
  match "/in-day/:skype_date" => "home#show", :as => :workday
  match "/about" => "home#about", :as => :about
  post "/workday/:workday_id/comments/create" => "comments#create" , :as => :comments
  post "/feedback/create" => "feedbacks#create" , :as => :feedbacks
  post "home/write_to_us" => "home#write_to_us"
  ActiveAdmin.routes(self)
  devise_for :admin_users, ActiveAdmin::Devise.config
  match "/auth/:provider/callback" => "sessions#create", :as => :auth_provider
  delete "/logout" => "sessions#destroy", :as => :user_logout
  post "/user/like" => "users#like", :as => :user_like

end

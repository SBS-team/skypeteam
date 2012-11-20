Skypeteam::Application.routes.draw do
  root :to => "home#index"
  match "/in-day/:skype_date" => "home#show", :as => :workday
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  match "/auth/:provider/callback" => "sessions#create", :as => :auth_provider
  delete "/logout" => "sessions#destroy", :as => :user_logout

end

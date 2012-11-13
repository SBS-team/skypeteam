Skypeteam::Application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  root :to => "home#index"
  resources :sessions, :except => [:index, :show, :edit]
end

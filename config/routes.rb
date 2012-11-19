Skypeteam::Application.routes.draw do
  root :to => "home#index"

  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  resources :sessions, :except => [:index, :show, :edit]
end

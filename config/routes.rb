Skypeteam::Application.routes.draw do
  resources :messages

  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  root :to => "home#index"
  resources :sessions, :except => [:index, :show, :edit]
end

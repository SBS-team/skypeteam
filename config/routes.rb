Skypeteam::Application.routes.draw do
  root :to => "messages#index"
  resources :messages

  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  resources :sessions, :except => [:index, :show, :edit]
end

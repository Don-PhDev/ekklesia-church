Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations"
  }

  resources :posts

  get "/about", to: "pages#about"

  root "pages#index"
end

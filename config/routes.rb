Rails.application.routes.draw do

  devise_for :admins
  devise_for :writers

  root 'welcome#index'

  namespace :admin do
    resources :dashboard, only: :index
    root 'dashboard#index'
  end

end

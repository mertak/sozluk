Rails.application.routes.draw do

  #Session destroy etmek için get isteğini ezdik. Sanırım.
  devise_scope :writer do
    get 'writers/sign_out', to: 'devise/sessions#destroy'
  end

  devise_for :admins
  devise_for :writers

  root 'welcome#index'
  resources :posts

  namespace :admin do
    resources :dashboard, only: :index
    root 'dashboard#index'
  end

end

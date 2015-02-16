Rails.application.routes.draw do

  #Session destroy etmek için get isteğini ezdik. Sanırım.
  devise_scope :writer do
    get 'writers/sign_out', to: 'devise/sessions#destroy'
  end

  devise_scope :admin do
    get 'admins/sign_out', to: 'devise/sessions#destroy'
  end

  devise_for :admins
  devise_for :writers

  root 'welcome#index'

  namespace :admin do
    resources :dashboard, only: :index
#    root 'dashboard#index'
    resources :writers, except: [:create, :new]

  end

  namespace :writer do
    resources :posts
  end
end

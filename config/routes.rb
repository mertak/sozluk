Rails.application.routes.draw do

  #Session destroy etmek için get isteğini ezdik. Sanırım.
  devise_scope :writer do
    get 'writer/sign_out', to: 'devise/sessions#destroy'
  end

  devise_scope :admin do
    get 'admin/sign_out', to: 'devise/sessions#destroy'
  end

  devise_for :admins, :path => '/admin'
  devise_for :writers, :path => '/writer'

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

Rails.application.routes.draw do
  devise_for :writers

  root 'welcome#index'
end

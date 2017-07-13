Rails.application.routes.draw do

  resources :registered_applications

  devise_for :users

  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

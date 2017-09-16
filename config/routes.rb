Rails.application.routes.draw do

  resources :registered_applications

  namespace :api, defaults: { format: :json } do
    match '/events', to: 'events#preflight', via: [:options]
    resources :events, only: [:create]
  end

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  devise_for :users

  root 'welcome#index'

end

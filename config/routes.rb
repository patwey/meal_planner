# frozen_string_literal: true

Rails.application.routes.draw do
  root 'welcome#index'

  get 'sign_in', to: 'sessions#new'
  post 'sign_in', to: 'sessions#create'
  get 'sign_out', to: 'sessions#destroy'

  get '/sign_up', to: 'users#new'
  resources :users, except: [:new]
  resources :user_deletions, only: %i[new create]
end

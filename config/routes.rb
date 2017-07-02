Rails.application.routes.draw do
  root 'welcome#index'

  get 'sign_in', to: 'sessions#new'
  get 'sign_out', to: 'sessions#destroy'

  get '/sign_up', to: 'users#new'
  resources :users, only: [:create, :show]
end

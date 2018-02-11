Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'welcome#index'
  resources :welcome, only: [:index]

  get '/login',  to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  get '/logout' => 'sessions#destroy'

  resources :users, shallow: true do
    resources :ideas
  end

  resources :images, only: [:new, :create, :destroy]
  resources :categories
end

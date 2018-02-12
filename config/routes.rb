Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, shallow: true do
    resources :ideas
  end

  resources :images
  resources :categories
end

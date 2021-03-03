Rails.application.routes.draw do
  devise_for :users
  
  root to: 'home#index'
  namespace :admin do
    root to: 'admin/posts#index'
    resources :posts
  end
  
  resources :home
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

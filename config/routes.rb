Rails.application.routes.draw do
  resources :branches
  resources :purchases
  resources :ingredients
  root 'welcome#index'
end

Rails.application.routes.draw do
  resources :shades
  resources :branches
  resources :purchases
  resources :ingredients
  root 'welcome#index'
end

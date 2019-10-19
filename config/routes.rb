Rails.application.routes.draw do
  resources :purchases
  resources :ingredients
  root 'welcome#index'
end

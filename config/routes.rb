Rails.application.routes.draw do
  resources :feed_ingredients
  resources :feeds
  resources :batches
  resources :shades
  resources :branches
  resources :purchases
  resources :ingredients
  root 'welcome#index'
end

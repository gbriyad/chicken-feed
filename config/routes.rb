Rails.application.routes.draw do
  resources :ingredients
  root 'welcome#index'
end

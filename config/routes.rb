Rails.application.routes.draw do
  devise_for :users, skip: [:registrations]
  as :user do
    get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
    put 'users' => 'devise/registrations#update', :as => 'user_registration'
  end
  resources :feed_ingredients
  resources :feeds
  resources :batches
  resources :shades
  resources :branches
  resources :purchases
  resources :ingredients
  root 'welcome#index'
end

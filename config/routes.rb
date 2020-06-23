# frozen_string_literal: true

Rails.application.routes.draw do
  resources :orders
  resources :cart_details
  resources :carts
  resources :stocks
  resources :products
  devise_for :users, controllers: {
      registrations: 'users/registrations'
  }
  root to: 'products#index'
end

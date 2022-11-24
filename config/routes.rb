# frozen_string_literal: true

Rails.application.routes.draw do

  devise_for :users 
  resources :groups do
    resources :spendings
  end

  resources :spendings
  root 'homes#index'
  # root 'groups#index'

end

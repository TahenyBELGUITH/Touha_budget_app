# frozen_string_literal: true

Rails.application.routes.draw do
  resources :groups do
    resources :spendings, only: %i[show]
  end

  resources :spendings
  root 'groups#index'
end

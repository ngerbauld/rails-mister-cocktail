Rails.application.routes.draw do

  root to: 'cocktails#index'

  # resources :cocktails do
  #   resources :doses, only: [:index, :new, :create, :destroy]
  # end
  get 'cocktails/game', to: 'cocktails#game', as: :game

  resources :cocktails, only: [:new, :create, :index, :show, :edit, :destroy] do
    resources :doses, shallow: true
  end


end

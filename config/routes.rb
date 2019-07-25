Rails.application.routes.draw do

  root to: 'cocktails#index'

  # resources :cocktails do
  #   resources :doses, only: [:index, :new, :create, :destroy]
  # end

  resources :cocktails, only: [:new, :create, :index, :show, :edit] do
    resources :doses, shallow: true
  end


end

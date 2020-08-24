Rails.application.routes.draw do

  root 'cocktails#index'
  resources :cocktails, only: [:new, :create, :show, :index, :destroy] do
  resources :doses, only: [:new, :create, :show, :destroy], shallow: true
end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  root 'top#index'
  resources :itunes, only: %i(index)
end

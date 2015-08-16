Rails.application.routes.draw do
  root 'top#index'
  resource :photozou, only: %i(show) do
    get 'search', on: :collection
  end
  resources :itunes, only: %i(index) do
    get 'search', on: :collection
  end
end

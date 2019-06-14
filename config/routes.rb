Rails.application.routes.draw do
  root to: 'books#index'

  resources :books, only: [:show, :destroy] do
    resources :reviews, only: :create
  end
end

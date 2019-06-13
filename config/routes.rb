Rails.application.routes.draw do
  root to: 'books#index'

  resources :books, only: :show do
    resources :reviews, only: :create
  end
end

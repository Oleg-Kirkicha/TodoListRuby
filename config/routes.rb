Rails.application.routes.draw do
  devise_for :users
  root "pages#home"
  resources :todos, only: [:create, :destroy] do
    member do
      patch :toggle
    end
  end
end
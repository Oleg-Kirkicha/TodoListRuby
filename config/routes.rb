Rails.application.routes.draw do
  root "pages#home"
  resources :todos, only: [:create, :destroy] do
    member do
      patch :toggle
    end
  end
end
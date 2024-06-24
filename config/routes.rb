Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :courses do
    resources :purchases, only: [:new, :create] # nesting solo new y create
  end
  resources :purchases, only: [:index, :show]
  resources :events 
end

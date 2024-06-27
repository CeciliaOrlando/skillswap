Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :courses do
    resources :purchases, only: [:new, :create] # para cursosnesting solo new y create
  end
  resources :events do
    resources :purchases, only: [:new, :create] #para eventos nesting
  end
  resources :purchases, only: [:index, :show]
  get "/my_courses", to: "pages#my_courses", as: :my_courses
end

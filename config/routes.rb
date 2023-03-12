Rails.application.routes.draw do

  resources :semesters
  resources :profiles ,only: [:new, :create, :edit, :update, :show]
  devise_for :users
  root to: 'home#index'
  resources :courses do
    member do
      post 'enroll'
    end
  end
  post 'users/publish_results'
  get '/profiles', to: 'profiles#show'
  # post 'courses/enroll/:id'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

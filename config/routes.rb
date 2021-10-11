Rails.application.routes.draw do
  devise_for :users
  root :to => 'flights#index'

  resources :flights, only: %i[index]
  resources :bookings, except: %i[update] do
    resources :charges, only: %i[new create show]
  end
end

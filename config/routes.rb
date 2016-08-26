Rails.application.routes.draw do
  resources :trashes
  resources :users
  resources :games
  resources :players
  resources :hands
  resources :decks
  resources :cards
  root 'users#new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

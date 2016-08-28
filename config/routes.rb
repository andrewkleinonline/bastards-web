Rails.application.routes.draw do
  resources :trashes
  resources :users
  resources :games
  resources :players
  resources :hands
  resources :decks
  resources :cards
  resources :sessions
  root 'sessions#new'

  #post '/sessions', to: 'sessions#create', as: 'create_session'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

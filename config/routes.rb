Rails.application.routes.draw do
  resources :games
  resources :players
  resources :hands
  resources :decks
  resources :cards
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

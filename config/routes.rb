Rails.application.routes.draw do

  get 'ranking' => 'rankings#index'
  resources :players, except: [:destroy]
  resources :matches, only: [:index, :show, :new] do 
    put 'first_player_goal', on: :member
    put 'second_player_goal', on: :member
  end

  root 'home#index'

end

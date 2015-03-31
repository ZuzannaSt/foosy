Rails.application.routes.draw do

  get 'ranking' => 'rankings#index'
  resources :players, except: [:destroy]
  resources :matches, except: [:edit, :destroy, :update] do 
    put 'first_player_goal', on: :member
    put 'second_player_goal', on: :member
  end

  root 'home#index'

end

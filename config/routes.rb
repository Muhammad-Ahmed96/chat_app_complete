Rails.application.routes.draw do
  root 'home#index'
  devise_for :users
  resources :users

  post '/add_to_channel' => 'users#add_to_channel', as: 'add_to_channel'
  post '/make-notification' => 'users#make_notification'
  delete '/remove_user/:id' => 'channels#remove_user', as: 'remove_user'
  resources :channels do
    resources :messages
    member do  
      get 'add_new_user'
    end
  end

  mount ActionCable.server, at: '/cable'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
